Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08186C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBk1ZeqWqkMzfPZglCYiALSDfj+N6We/OCFK6kR7Aow=; b=U0YDmmONRDmOEoR0f5U5TjGuor
	3f8aSYF1M9tFWCLNCDACjp1+1RAyYd+CQTE5N2x3X5RYBm4G0WPtoEJuFvJoTLFZsVuSuxA4wupPX
	oM6v27VhuWARIwbIa93uWgknotAbptSRi6QjmvENjSXGuN8mr7XP/00m+WP0utsDUwid5QAnmuvAX
	cktebrjyzjN12xmTIWDG7dBjkKD2a6nINBrZDndvNJGePiy0Mmktcmdm/aL/yic7TXRke1zmIUbY4
	Ip4byJeaBtHJHpv8SJs7KHkll5kYEZABM8U+TLaQ97g4Z3ZSuJM6rT7uVGQ779vQBg88cMgwyN9Vu
	qq2pt6Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavJ6-0000000CJdU-3Wqw;
	Thu, 23 Jan 2025 11:23:32 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavHo-0000000CJQO-0ldC;
	Thu, 23 Jan 2025 11:22:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1737631315; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YJvbM80sjDBPxamcQuyjR3dNW+7oLsMfUeBei18ZkmKSPDyjB/LnjOJnpsUd++rOGTaBmvhrXfMvYnLZ7ZQ14loAU08vUW+mr5At6X67ddGJL7f9TUSOxjPa351iMJ8lOfqzJ2z9CRGNw1T59x4TF6I5V0TruGPCI9hBPzVkWdk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737631315; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RBk1ZeqWqkMzfPZglCYiALSDfj+N6We/OCFK6kR7Aow=; 
	b=KbEWVc44sdtoTblvZY5FvIo48Pop0pU4E2E9l8ReZuKYY8ZSu3t86p9bRCnXu+13uGn2N8zmnDqTAC5BA3IjZm2lxC6Ig8anzOGPR5opO0tQWNRyz5U6pDcBJN7HAAjbeuWKbCYt86/lwnZNNCay0wE81gpFFryZgJc1XZdzgAs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737631315;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RBk1ZeqWqkMzfPZglCYiALSDfj+N6We/OCFK6kR7Aow=;
	b=kavhcopT+pSgJHgsA8KeuFJKKPZ8n1ybvrL0ZnhZbJ4DJD4pzRIiEo5h9Ct6KCiN
	wKUm9yMbK4KrTPLz77O+/CR6ReUDYpAToxGE42yK8fEVcDpFTBSVE93YsOuebK4ykdS
	/xki0nFO3PSsetB1ymR3bRkLzUp3Mn0DQbAZI0HE=
Received: by mx.zohomail.com with SMTPS id 17376313084433.398115110351114;
	Thu, 23 Jan 2025 03:21:48 -0800 (PST)
Message-ID: <67fcd668-dff4-4dda-bc65-27f13293680f@collabora.com>
Date: Thu, 23 Jan 2025 14:21:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Tim Surber <me@timsurber.de>, Shreeya Patel
 <shreeya.patel@collabora.com>, heiko@sntech.de, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
 <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
 <925d7571-48e4-437d-b55c-3f7bbad8af1d@collabora.com>
 <fbb5016e-678c-4e54-a6a8-0ccaa2bdf45c@timsurber.de>
 <a5226fac-2a5b-47f3-b32e-8662bf932bd4@collabora.com>
 <d61e344f-fcdd-47af-a142-e8d42edec045@timsurber.de>
 <9399a881-7d45-4ca3-8249-2e554184d038@collabora.com>
 <bed5f370-113f-4109-b8f4-870dd15e93ce@timsurber.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <bed5f370-113f-4109-b8f4-870dd15e93ce@timsurber.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_032212_312130_57A63554 
X-CRM114-Status: UNSURE (   8.90  )
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

Hi,

On 1/19/25 05:14, Tim Surber wrote:
> Hi Dmitry,
> 
> I enabled the debug output and ran some tests again.
...
> 
> Observe the reported fps of 86 in the above log file. Also gstreamer
> reports a framerate of 214072/2475 - also around 86.
> 
> I could sometimes also create the "Device wants 1 planes" using RGB -
> replugging fixed it, but could never fix it in YUV444.
> 
> Next week I have time for more testing.

Thanks for the testing! Could you please try to test YUV using a
downstream driver stack? If it will work, then please post the
downstream kernel log. Will be interesting to compare the timing values.

-- 
Best regards,
Dmitry

