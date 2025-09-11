Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EE3CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 00:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmD1no7rgdQAGC5IUQ+XMznH/3oaaNJTNohvsvqMTlI=; b=lCcseTqP1HCSReFTJXBWXzYGyG
	XYm9+nDJPELtK/gfcIV8Jr2xU4vg45dSWnxH0FWjb0+7twtLqeOoCUO2Y5kJ1VVt37/nUUJIDF+AQ
	Hh/YNzJQ5YjzObVZ0X1ph1j4QMDLCCWt+Ucr1Z1HJ+9wwhgiVJeJ75Zq0PsHPeD/UfwSX6JahuaTP
	blKpJVY09UlvIefZ3AxEGTKuHMSGdE9CgR/x65zpwgBX1MoGkYcit4zOB10qxl5ykgxdcGp3BPnhN
	GMSXMNPgJsDqs15zbbQh//GEdRxfTfLZKif6ohow2Lnzkp4inR1GIR/Q+QEVaFzBQm3dMXTKaiMDR
	9fzWTFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwV2x-0000000HTYx-2PMC;
	Thu, 11 Sep 2025 00:20:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwV2w-0000000HTYB-1n1W
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Sep 2025 00:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pmD1no7rgdQAGC5IUQ+XMznH/3oaaNJTNohvsvqMTlI=; b=Qlz88nfhA0nCLdu5vCsgB0bw6Z
	51gE6afzNMWBugF9Lyjgz9CKOU4qM0YNKOfszGIsdRXzeXAgHxvkfymiLrOATZCIAsfWHgg0YjUpz
	3ORd/+F4NsbRrBX87SC04cngZvJZqTWH0d/zSQKLb1qnERkmBsxDOhYmo//bw2p/L3EgbKpw3tq5A
	FtrLDWUzj8urV/pB2nAPEDXbW6d18B/3pMkKKoftrbVLrlpD1nDoJiLnMET8mChHMtLntYmKz+mU7
	xBVQsA0bhXJHKK1IO5ctk9+48JfIAvnGesFfvkVWNwEN08LiyRAfnCH45Kla2T45axhdxnCZqWMrq
	piNDsMDA==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwV2m-00000005yfg-46lW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 00:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757549974; bh=rm3AkZAbKSbhIyZ5CfHZ/hYbK31V9mAjqEvngq0N62k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QxvmvdCynwiQmyUCEZglIXJlONCSxFKLU50Iv/+NUOLlub/WKSfFxf70fHjOMpevt
	 JKkAMlt06icmssvcOsv6yAC78b3S4Fa6kWE+2z5fUP/KwrijebRJirOMj7Sat8E2Ae
	 e+dlrOXhVv7HPsIS7bPUmTxvncRlSVxo4jBVBFNL7V7qBeNiSqm3Kr1l7SqRbaI/NE
	 6OjFsuF5o6jaYiKz9+ODdUotWik9XJR18ODIR3aKxCrgYn/Bg/FMZGVCeL9tss8vcM
	 RMGr9P2pAjjhs48t2KZf9+d8pTp1DhBSn8vSMzQAYoB3s2xNVbnt3bTI59Vr8V0/Kr
	 N6m080/JnKzhw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 3C92B3D3382;
	Thu, 11 Sep 2025 00:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757549974; bh=rm3AkZAbKSbhIyZ5CfHZ/hYbK31V9mAjqEvngq0N62k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QxvmvdCynwiQmyUCEZglIXJlONCSxFKLU50Iv/+NUOLlub/WKSfFxf70fHjOMpevt
	 JKkAMlt06icmssvcOsv6yAC78b3S4Fa6kWE+2z5fUP/KwrijebRJirOMj7Sat8E2Ae
	 e+dlrOXhVv7HPsIS7bPUmTxvncRlSVxo4jBVBFNL7V7qBeNiSqm3Kr1l7SqRbaI/NE
	 6OjFsuF5o6jaYiKz9+ODdUotWik9XJR18ODIR3aKxCrgYn/Bg/FMZGVCeL9tss8vcM
	 RMGr9P2pAjjhs48t2KZf9+d8pTp1DhBSn8vSMzQAYoB3s2xNVbnt3bTI59Vr8V0/Kr
	 N6m080/JnKzhw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id ACC75380DFB;
	Thu, 11 Sep 2025 00:19:33 +0000 (UTC)
Message-ID: <4f4766a2-5c94-40bf-9016-2e5412796c1a@mleia.com>
Date: Thu, 11 Sep 2025 03:19:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm: dts: nxp: lpc: lpc32xx: drop 'clocks' form
 rtc
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241016-lpc32xx-drop-rtc-clock-v1-1-5b271804d3e4@gmail.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20241016-lpc32xx-drop-rtc-clock-v1-1-5b271804d3e4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250911_001934_307867_11B1F904 
X-CRM114-Status: GOOD (  13.67  )
/bin/ln: failed to access 'reaver_cache/texts/20250911_001934_307867_11B1F904': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_001934_307867_11B1F904 
X-CRM114-Status: GOOD (  14.34  )
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

Hi Javier.

On 10/16/24 20:14, Javier Carrasco wrote:
> The RTC does not provide a controllable clock signal (it uses a fixed
> 32768 Hz crystal, the input clock of the SoC). Remove the 'clocks'
> property to better describe the device and avoid errors when checking
> the dts against the nxp,lpc3220-rtc binding.
> 

This dts change as well as a counterpart documentation change won't be
applied, since it breaks dtb/Linux ABI, unfortunately.

> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> This patch used to belong to a series that converted the affected RTC
> into dtschema[1] (effectively moving it to trivial-rtc), and dropped
> the signal clock as it uses a fixed 32768 Hz crystal.
> 
> The rest of that series was merged, but I did not get any feedback for
> this one. I sent a little reminder ~2 months later that might have gone
> unnoticed too, and as a few more months passed since then, I opted for a
> resend with the single pending patch. It is of course not urgent, but
> still relevant.
> 
> Link: https://lore.kernel.org/all/20240413-rtc_dtschema-v3-0-eff368bcc471@gmail.com/ [1]

-- 
Best wishes,
Vladimir

