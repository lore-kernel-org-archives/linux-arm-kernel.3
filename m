Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE596CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 11:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYdBh8HqFVUTCDaCvvuGcXy1H5xtNbStwBTR5IHmnb8=; b=LVN76X1m7NKBToA8aWIlwKGm7+
	Oylv2izsZ76BllEpiAN1HvDIzxW8cYkYaFeOpoj0+0Ymv11vlQsmOPHiYrkXAhHmes+Af/PCkMF5+
	T/D1oys9euP9UgST4rCtP2yLJCY0usujpFPon+32c9jkXFbcMHbjzHWmLrcs+ve1YP1jzNAiL73ye
	DdyEqCDgRE5WorTGiMLgS+929TG3VUYYdUzl9Umucujkf6fvMpMcIfeY17DkYBjOs+QJqLPNGZpPr
	r8dl1iC6SqTNSuAMF4eipwAx7tPFpxrvzvEBOzouxxPAHuduRe1QUlOvGSZBhjmSu3UQUjr7ChhaK
	04KKkrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uurID-00000007hXB-055R;
	Sat, 06 Sep 2025 11:41:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uurFO-00000007hLx-48bF;
	Sat, 06 Sep 2025 11:38:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so14143715e9.0;
        Sat, 06 Sep 2025 04:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757158701; x=1757763501; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYdBh8HqFVUTCDaCvvuGcXy1H5xtNbStwBTR5IHmnb8=;
        b=fW0G+iz62O1uw5Mt2gw0vY8qIAWiDYn/cOhagAbiNgNkz1paLO9gS4b8YtjmR7BD4w
         VTtAb3qSQ+fAg/4lt+MwM2n/XMJhtW9NvCfpdq7w29cX+mPDhM2hhrxbWNMbUJ0IHQmx
         VG6fNwgAZHxzlGOfsVU+ISfSXbkwAR/MxZEU6bnochKcpMFyFKbnNQHF5+pCev12KZpf
         CIlqQTU2/1WUB/w0XQhAZ3a+iN+vMlF0h7Tqo3fsZvCXh5Oi0kXNu2btb0YRDtFDWu1i
         QkH8CxSHw8MC/D5aCrouOgyLyKv8S2+vdLmJiZ0tSjPuK2iAs+LTNdHotfFlil4mJ0Eq
         cq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757158701; x=1757763501;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYdBh8HqFVUTCDaCvvuGcXy1H5xtNbStwBTR5IHmnb8=;
        b=QShrWoPWsF3CTle3ibdmN/4jH9mYpl2Kr3cgDVbKooYXsYiFrJAM26M34xfnALfX6p
         etHyDvUbhJHQx6+jS125EqJBDDHKxhJgP2x5NcyEBoX33WJmE8WurgViI3zl0aS54B/0
         nBns372Juxn73AkwmluCn7ow+SaGii3WCdHrU1agxxvlEqusoEaFwG+Cl8o0LIuOVPXo
         sUWQHRMp4H4vM/d8zW2p1DNGecx94tSDp/PQlPxsGeFxD27Lzv6rp46RsEhu4JECCzM1
         m1XqXFedJp6qjwwgzz7uzoHXPR33pyRmue+sN3f4vQw3rn85oZibjXBqZ5ki0BqI8ZVN
         Uc6g==
X-Forwarded-Encrypted: i=1; AJvYcCUxSCqxK1fJ9lv5W8ikJrQB/dxHVJyxBFSJCB7OodRY/l4cgTcVQStQTGa4IoJHck6qIMNdsBsWJK3L4BXjOv65@lists.infradead.org, AJvYcCVJ/WMABbczU+8RTWtoOZL2AFgXOiSyLazkAJ8rZ8LZbnetTsVsPo0A6Gmn0nH0S+VMyY8XQapy4u9EcxIDI54=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnr3olu31uYsFJRwPHRBkoyTK7f5F9y4Bt0suNtg3OM0iNGFeR
	ZAzwJyMOBBHxabf2dQulJuAOk/j9jrzYiSjoWPQ+TOrDILY/MxBH8qQ2CO6//fWX
X-Gm-Gg: ASbGncsuilkrtA9GtZTBk3/ieoZz3ubOjGHTGXtpSvkHxhRitAkbl3xZqFenA/CvUZK
	CnwBBmpQ0+J0nPvoIpl0cBJXYF0NMQPN1vUYYPvlmPBIKOU9DqYswknmBzpcyydX7KDHW6Hnx30
	KJg3BrYbU/syvOdSSx6jthoErj169BV2sMqd1rX843sWAhjSVel0xMMA5LAn+THxW+Pv357ka4Y
	llt1ACg4igu1SYS0q19yh9o1wNQXCozIEtdWSa9Y/mlPqiYOabxGBZuz9x954pQl8Six1L2bBTj
	dtnp7oUBtOYHXVX3afsFWzXd6okWrQ5ivoKvXZpSiIJYHw8IG2AXpP9xMbc4UikA1NWNdTEmjge
	jAzf2LgIhaLOUyCVLv6f9udzsui5g9JtAI5tYgqzxKyNW29s=
X-Google-Smtp-Source: AGHT+IEpZhQKNYrVkTK3+mcth15u3ClT4pnjzS//5juTYMF8ueBViMJs+dSUMoUZqlbI5Gwl7TP02Q==
X-Received: by 2002:a05:600c:8b6f:b0:45b:86bb:af5f with SMTP id 5b1f17b1804b1-45dd5b32671mr56405465e9.6.1757158701184;
        Sat, 06 Sep 2025 04:38:21 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d95df59e50sm19543645f8f.23.2025.09.06.04.38.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 Sep 2025 04:38:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: add GPU powerdomain, opps,
 and cooling to rk3328
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250906112030.1829706-1-christianshewitt@gmail.com>
Date: Sat, 6 Sep 2025 15:38:06 +0400
Cc: Alex Bee <knaerzche@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3EC81CFB-7BA3-4AA5-8F1B-8E55C265338E@gmail.com>
References: <20250906112030.1829706-1-christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_043823_026893_7459B253 
X-CRM114-Status: GOOD (  11.62  )
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



> On 6 Sep 2025, at 3:20=E2=80=AFpm, Christian Hewitt =
<christianshewitt@gmail.com> wrote:
>=20
> From: Alex Bee <knaerzche@gmail.com>
>=20
> Add GPU powerdomain, opp-table, and cooling map nodes for the Mali
> GPU on the RK3328 SoC. Opp-table frequencies are sourced from the
> Rockchip Linux v4.4 vendor kernel while voltages have been derived
> from practical use and support work: keeping voltage above 1075mV
> and disabling the 500MHz opp-point avoids instability and crashes.
>=20
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> Changes since v1:
> - Use opp_table_gpu not gpu_opp_table to fix dtb schema warnings

Please ignore v2, I misunderstood the rename and should have left
gpu_opp_table and renamed only the second part to opp-table-gpu

I=E2=80=99ll fix that in a v3.

Christian=

