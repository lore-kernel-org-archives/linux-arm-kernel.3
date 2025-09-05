Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94F0CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sg9V7A+vveZVwEgb6/4ZFeGTdbh9RAwHCgZXiFP+1HU=; b=Q7pnxyPt64e/z8p7liznjDwzt8
	ScAveLEBERvHl+0UHI2eYwJIVZas4OsbSmWjJQ6O9i3uwNQme/VVq9oyONwxmMnE7Si82TuwpmMkp
	UVSIDBdVO6hUZ2H/4l8jqF9YXol8BWTaK0PUvR9e1eeuWqYsHrn258IuGQvUpI2VXDiD/78odfiea
	DSJKpqkGLeFae2WFx8ngTa0qx2NsSQLDLmovLXPDtLD1bH+HrPVC5fxU6YbxyyuplWL1PLM/iQ/Pk
	GjcvvnMLD4CPXi4Karp66IPu7ewIwyzRckyU4eBiTYqRREvBFXvJnbl0vPFlWII4D/zdHNvj8hK6O
	jIM2yYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZB-00000005Y69-3Rns;
	Sat, 06 Sep 2025 00:14:05 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuep1-00000004yzn-3dgQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 22:22:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2445824dc27so26497225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 15:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757110939; x=1757715739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sg9V7A+vveZVwEgb6/4ZFeGTdbh9RAwHCgZXiFP+1HU=;
        b=ScvSaNcuD540sCq/DFt6KHEXIfotBbLMIptvIad52xOfWWDBvXVZCAjzdTqz6kgtBr
         jS9lSdmQ1RiE+G6Rz9Oy8tZrTCZAPXAUHzR0eHHHD901Pag0swvr2lDhI/MIsckXurIg
         GHtStXo7qPgjWVgVoSygKoM33RLlpQoYznrUaeSQ7vbUV1fdNRLydbnF5fH3VQVYceFo
         6fTIl4IL303A9iTH8vwRJXjfB0lFi41c5tIdaFZ/Ad4LKmL7cbtYADnRXgYY/B7b0gIZ
         /LWV3QPJVfsuuCBIPN9kv6DhkuOClomFqfG/UJ0VonLes7XWqXExRJrDszAD6iaQXOkC
         c1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757110939; x=1757715739;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sg9V7A+vveZVwEgb6/4ZFeGTdbh9RAwHCgZXiFP+1HU=;
        b=KGkjryg86P75AQxaeYd/8hljvINhsP7YoN1iWmm8PR6P8Y6dEdj1OqYghfEslPRhJo
         q3cgt8K3mPYYTCvjmLAbVVq9KMPVrrDDVbRdRv6e9MQYaw9pFTxiyGhudTe4jQCg5bAd
         5zPiz/mRMRtPqRnTM4/ZITKmCLUFnsL+KxUgiFpEzVabBkcsswlCDGKngmw45cPh5/uU
         NUuOQ1kNs7mNNaQyCLNwiOQ7b65NZaVlra+nxThyOLQZG/DM38Ttc5idHTKqcRserPcB
         5ZnL1Oz+6ACl0dvtpzjQ8hvWxsGcCOarJ7eCD5zmmXUxeeeKZ6zQg5MOeMxXJ4UlZS2t
         WVzw==
X-Forwarded-Encrypted: i=1; AJvYcCVwYkKDJ5dtN6h+rVCKC3qwTWWwh0hSZx/IRxQDPYMU4926eUFv/bKoZqCCT2j2TWSC6LWbS+HnFzgSI/zXfKVp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9TK++AQ0iazwnWghc8ck/vrmEx/ThZrPsreY9MPXGmbdo23vF
	hFLGB77EiN3brag17/nfMpogTgmhWOOElP5HkbEExKBt8+eNNfIsM6ehq8ITHywVdpY=
X-Gm-Gg: ASbGnct+E3jeCVO+8+oQ4T/lypvJzGkBLD+vtFPCn2kvmrAuuoycL9wKbdSaN/TESgm
	hHG09lCEz3raurhwYvvlMjLTERpyKipe+6Q7oN/PbPTMRxj1qEY5bMI1/LBajvvjuUk+r8NMX3X
	GDDQpKpFI9njn1d48xzQ8Ijwh92s4tM3jECNYOA657NRt2l1GAG1nlI8XAtT40/NtUbIEOu5vvO
	adIZ8ixms4N7dVtGH2PO6qB5pPVxjqiUkpp356eF0MM+VIA0cWMv9zbzwv4SZa8+aBS6YYnwC9r
	utMpiobl8d9b6Mkfk4fGMi+JS4IzD+EVBa/1DvDaTIEFTAWy5zF4IR0L++E245jjPxOeLmW81wC
	KDnQrKnfHNzUDQT9ibSHXPInKTTLNk0Q=
X-Google-Smtp-Source: AGHT+IEgDKOlBK6x0QOw3W3CHGpa5Cc8uz1T8qU/XEUIc8y0zuEtK7ONrjwU8Ktw48bTs0lLqjmlXw==
X-Received: by 2002:a17:903:3bc7:b0:24e:e5c9:ed02 with SMTP id d9443c01a7336-25174470d47mr3109805ad.54.1757110939089;
        Fri, 05 Sep 2025 15:22:19 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm13579564a91.21.2025.09.05.15.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 15:22:18 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Santosh Shilimkar <ssantosh@kernel.org>, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miaoqian Lin <linmq006@gmail.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20250902075943.2408832-1-linmq006@gmail.com>
References: <20250902075943.2408832-1-linmq006@gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: pm33xx-core: ix device node reference
 leaks in amx3_idle_init
Message-Id: <175711093813.666031.2668373270360080348.b4-ty@baylibre.com>
Date: Fri, 05 Sep 2025 15:22:18 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_152219_909662_73167B09 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
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


On Tue, 02 Sep 2025 15:59:43 +0800, Miaoqian Lin wrote:
> Add missing of_node_put() calls to release
> device node references obtained via of_parse_phandle().
> 
> 

Applied, thanks!

[1/1] ARM: OMAP2+: pm33xx-core: ix device node reference leaks in amx3_idle_init
      commit: 74139a64e8cedb6d971c78d5d17384efeced1725

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


