Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C8DCC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYeQNT3tjV04rlnvVwiGcycmzog7//CwXI+8H6Sk9I4=; b=1ORYRQ3mHpgrmDpVvvGmoMLr/I
	so4Xef+zWolvHth7Mp27ORq+0j+WTr4wmSiag9r0GlNzkIFjn89Kv5g9utntv57x5pJffWICZa4zJ
	mENEu9urdX/08B0cbcD4QuyZYVWhv3s4lXGFakF7egpiT5sLQtaDkW4tw7K5L9141q1hS65mMhfOM
	WNN9MrgBfIpihmheTx/zFzBoNfxPWOKx5ujErBYUIVYivYrQ5wj5H8DRxGondzGGRqJVUxgwdYXE8
	N43mS7MIJD4fM18SrZAjlERfmT9hDfv07e+/ON8mOrUR0ChVL9Oxd39CNJ6s7DfmYUZDPzA8ALdhr
	6OA45XTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeBF-0000000DEQc-3viM;
	Tue, 13 Oct 2026 15:12:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeBC-0000000DEN9-2Sf0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:12:40 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48dc202a60eso1104032f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791904356; x=1792509156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYeQNT3tjV04rlnvVwiGcycmzog7//CwXI+8H6Sk9I4=;
        b=ZORHDIBXmEslYK1MdcUI8PktjT0G1HtxQ+/D/AH3PxB9AIEIn8ME7klHndCd23c0Xe
         v1YWTpk8QLFsSeLkXobz+eAroZ12U/lhRFGDQclQHM2jtSsWMToKTQ7osYgkVxQscnAl
         9U4gTgfAMA/u3O2KVwGDA4now6Y13c3zZaJ8CYjvBlCNrhrgpYD27hnQvaY3/Z0vi+aL
         Hh8A9zO4NIaDQp/ukJzApWdlMs0QM2ovUc4yhZ/gmrgj2HFCybRFUTxznWpHIbYFF+Qe
         Skz5G2w1cvdOtKrG2xAUQHMsMPXaz0IrxjoEVXaYIcrdFi2SUdRH7V0ci1gNS0nGKmDV
         boOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904356; x=1792509156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYeQNT3tjV04rlnvVwiGcycmzog7//CwXI+8H6Sk9I4=;
        b=rM82L7gPgU1udLAZSa+y7Pl6N5a+abM+6V4nLj5AYQMrVGp/PqP+E+NiEiY0TsVnQA
         1ble/YvP9EL1bwlH8aDAagxEAJhgguhDz25OIt6vsho0HmWd/58lKdNRiBiOTaXhq2DX
         Tkn5jJGcAjRn16y/CquhAGnAGkEtOaMxxyVX/sGnPxLpt+1l9ADjD026YBeXUxh7kVoK
         oDqtO5/SnqBJrXmVDmFdqAJmMSFINTbsioBY+Men+RAr5ml+aD4SJbGyW0JmOq6dJLDd
         WKNfHPRx7lIFcBjT3mAdCYzBRNfvESlXAOdr+nv26AMHIU2u7Q5Tf+9/K+IvDPhyWrdX
         tkMg==
X-Forwarded-Encrypted: i=1; AKwUvBxb6lIfHaY0LTe+T/JkzwZf39cVKSyT9eAuQj2uKfX9fuiUwEgE5dILWhf+TfR22iEZJaxIuUILqYOh81lcgW8H@lists.infradead.org
X-Gm-Message-State: AFq9FYJLSTriIQVG7L7vV66a12PFrtqBfuGq35lT5Ovmhpnh8kwEhSOJ
	6rrZayWRw2GM8+/iYs/Uy02fPoNUG4j6qXUbkz6hCpf8hjprjLJXXus2jBqTWa5Ngto=
X-Gm-Gg: AYBFou00+EgXliNPkiVNl8KmR8a4VqfDsuymtzyu1i0YD4O/l6XCVT6Z5hsu4ANdnoa
	LstNvQiV0LQK1JR/7lFAnXukre6vb8CxsqqPZRzh+2BajtnwamA3OP4kfHngaAy4GWudcHKM8v9
	imZq2363Rf2e3riiDfKRtCmh1+Q55wjxM1u0RqCo9i81yglKRbPvjz2oiVv4jzSoiLE4fuxpVEx
	ryic10CttHIPi6NXk4XwZuiVRPTzkH3cYvveOh1U3PQAGoOh52P3ZXCFJnDrll5XBnzvmaE5p1A
	/+xywj9Xl3k8Be2Y9qub83bHrP0uhItlwcTLAWDYtSEG6q41LNx3rqX4E3t7hgGFEwTg7E+fSxl
	SGm/I6Mmf9+N1KEwWY/fc23XkSsdURAI7dfeN1+bp0lPegH8RQ/E76sGgiLZRhnkgJ4luZImfBT
	mioiFNBgEREqyEGMJRBYN7kFzQsa7TXLd8NXdPmCwB+QQhMaYUAg==
X-Received: by 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr233814475e9.15.1791904355994;
        Tue, 13 Oct 2026 08:12:35 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967c03sm5740158f8f.6.2026.10.13.08.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:12:35 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes after the MAC
Date: Tue, 13 Oct 2026 18:12:33 +0300
Message-ID: <20261013151233.2474217-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
References: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081238_653136_2D28CA9B 
X-CRM114-Status: GOOD (  12.92  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 10/13/26 09:53, Paolo Abeni wrote:
> The above looks like a significant amount of complexity for OoT driver,
> and I understand it could be solved with a different kconf?

The PHY driver is in mainline, air_en8811h. Only the board's device
tree lives in OpenWrt.

A config change can avoid it, but it is expensive here. Building
air_en8811h in is not enough, since it loads its firmware with
request_firmware_direct() from the root filesystem, which is not mounted
yet when the switch probes. It also needs CONFIG_EXTRA_FIRMWARE with
144 KB of blobs, in a kernel that OpenWrt shares between every board
of the subtarget.

Is that the expected answer for a board like this one, or would you
take a smaller change in phylink?

Aleksei

