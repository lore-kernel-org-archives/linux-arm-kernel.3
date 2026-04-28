Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDA9FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 21:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=; b=kNMCwKq9sp97+Auc7EuTIe8ux6
	H+A6fYjfbuYP/tweGhnhymHYGfYWO672fvRk6lWvSWuI1OxmXKZHFV51P1nZxWlvZWPtK4sUkcWr2
	FOzNCGbBaS7gJYIbW1dOn6EOqg5/qSXP2ZAFX238diW+ju083Y7PgrcQVtnH5OsdiFxe8PNpoSEol
	WEU55kl8jZkXBSunCZvs1CTBWiZaCDWXcAt+ikJ5WZ7wGZodCD42g4DUyga3ahXBDnvLvCwxdpzCv
	45KT6aHh6PgfbDv6hMjXOQCRcx9VI5N9ONyQoeyTA4rtoz3w3ZKlTm+wDjU0+AJzz62zg6sviAYkn
	UjB2vbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHqDT-00000002XDO-4BbX;
	Tue, 28 Apr 2026 21:43:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHqDR-00000002XCc-1l5j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 21:43:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4891ad5c074so26995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 14:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777412614; cv=none;
        d=google.com; s=arc-20240605;
        b=BDw21dqH7naS31qC7HRjEACLZZZIEqfpxGsUvUvO/QqRFjCeWX4UQPa7Qd9i64Dwpy
         ger2MWU6QGLwxVQ+glfvHaLB9k3QAR6LuOqykTt8JjbUTHOcyaffr9sFcJgNCJauNPe2
         zUuMQKnh0euPl1/kEO8hrjdlPiDSY6JSOSF1agV9jXAOj4reSspXfBLiPJmBTB4drFMS
         oMdbSrh2ct5PuZcY38/SNXs1iwmkKaA0TlnhHxsyqbsTwafM9x6Q5pWS+R2fdk1OSiVX
         aGiqFh8dRPKxO/RqS0zRQ6ZMBk24TRIUyVqS8c7hsU4xTs06VSQ671yeU2DHJFgHdIUV
         WQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        fh=APU/qmA4YcIiajkgeO0QKETGMyTn7tGvptZyGOmMvPI=;
        b=VAm81THlpJnZEwyUWA6XxCetfM/U9mWMG9f5k8OWyFiLi4So8nNUrSzMlaiSlUOnQJ
         wnsVgFYxt8Ry9kMo5Jhu+MG+Jg1ovi1v8wS19Jx4vFWnVfXUK7FQXMElbGL8OPnYeHsF
         j1JGKMARoFj7FN2FaUS8ydDI64dFVmvuSQsp8LDj2YkdkAlxN+eK3KjuUHIbHfWRIGc3
         0N8ZFga+ePizyRiI4CCd2N4RToqCl6YHaQvqnKR+s5h+cmlNaUeKLpY17uZFWk7BtCaW
         6tRxgCuMLDpdOTtKTT3TGbuaA3NdAE5LwCHF7gygTrP4Px7otUWQZNFIxsU/Bs7F3Tfp
         /APg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777412614; x=1778017414; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        b=QlVbooQQTLH55GabQiB/fdMbA0/7qoeIxFB+aw1ONV+Ol73yQWNK3+yQ+0tEvcLtvc
         zMgLAyIDOuGWOk7A9Tj1fe1Vuf7+gizgt1xBPjpo8SZ7j2CG/MG7At0wFPjra5q4BuLb
         R7OO4wjVwCeG2lA+oHPAwcn+UAgPXvmqSvTG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777412614; x=1778017414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        b=GnJJXFMtT+T7ynjLUY1xnm3PCOG/J3OCF12Diinbxj5clPbNw/b8Un78I7bWwBpvAS
         tYbrD5d6xN/HOlqHgIGnWyvDPpTKGAQARdYDoR4ZNru3e2v1r6P/Vl/g+CEVMVVKibUj
         aE39ahQ4cXUfAIGt59c/jSTldKDbSyp40CPLpnyMqbmRwF27XWleLKPuRe1jAWeAga3r
         Q4YGvqFg6DuOx8WQF3MAW3gTN2JHzeRPS0vL/FbcGkNrueHVcOZqS7Jv3/BaJQf/T3u+
         96Zf/mtUIh5ThvGsyr/mW4f9CPCYVnhvEYm3kMrnRPRgeVm7V5TJFT8yZY7EDQ/iBgCq
         Arew==
X-Forwarded-Encrypted: i=1; AFNElJ9yj8UCHC8lRyOaslbq3jpVrBXgzqvn+m/mYg0xEzccfyeKTDRJ7J4ctOkl/eXKxeyVPlDCKIEDskSd+OVU0/+f@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/PSVlrYq0G4JMn9c8GDh4ROEf5TktEBRP+62w6F3L/AwjZpeE
	lFGxRsuaW5/FOWCPkjSQ6iwgfzEJxfHLUrMr7W7vxbFZ3uUV0W+Tri6r0+5Qr2XrwDLiwM7HNnj
	JIH5hft8QyG7Kh0TJaETAG8ktzlxfw6SIhR0HdsYS
X-Gm-Gg: AeBDiesPSskevGksVb3awPIBoM0xfosOqsb0I3TMJb42BxWdzV5QHri8vtU4CatwR8e
	2UXOhJxPMBLQIIZUATxkseXGJBqo6AUlNCCT51cYnRB98ljWqRH52Ljv8M/Uu+YJRwE6b3vctyy
	Ydk1naAGHkyRtJfMZZxXpcj13rGVl3fiGNxdojVDQY8si5P2QdtF3hm+GW2WO8eTBVJMe1SWIMD
	4F00IDM/QP+gcWNm521Uu0QhOQQ4UxYFKUdbHAmrm/+dR/EdcYAT13vTdzy6gC0A0C0gm0lKdpI
	NZu0Re2rUmZQyiUaEsvX43gYY1D3x7kPS3RexyUYoH0PLNlInPKZmRv33Q==
X-Received: by 2002:a05:600c:530c:b0:48a:5f32:62d0 with SMTP id
 5b1f17b1804b1-48a7ba07d5dmr322355e9.12.1777412613805; Tue, 28 Apr 2026
 14:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 28 Apr 2026 14:43:21 -0700
X-Gm-Features: AVHnY4LgrR9BMoyPVl-dbhODH2S76f3l5WcQRNgpXekO-MzmQp39W8EwHdrUnso
Message-ID: <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_144337_482829_FDD0E323 
X-CRM114-Status: GOOD (  12.60  )
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

> I reviewed Depthcharge code history and found that this problematic
> bootloader behavior dates back to at least 2014, with the Tegra/Nyan
> device. Older devices may have similar DTB structures, but I'm not sure
> if they have the same address-cells problems. In any case, these changes
> shouldn't hurt even if a device was not affected.

I can confirm that Nyan was the first Arm device shipping with
depthcharge. Note that the Exynos devices are all older and shipped
with an old fork of U-Boot that probably handled this very differently
(I believe they had `/firmware/chromeos` but not `/firmware/coreboot`,
so they wouldn't have had a `reg` node and should need no `ranges`).

