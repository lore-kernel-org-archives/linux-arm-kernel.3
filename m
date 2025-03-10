Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CFAC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVgrYAqOmzDomPVWovtiT2BUnSO4CsUu2Ru+cq5kIeM=; b=crc3sQYabSI1h6FXmQg4qHMZ5V
	JQvPryYIloanMvwrGCBWCfU1d2EfzFgOVAKm7/coOz2hb2k+Ed1ga3dI6YmcUuD9VHpHCsmViT501
	ilff3eb++IPGE0jHW/8A87RIy1ws//tdkwuYlFqD9rvHd28JU2qKadoufr907CmEJ4D0CvtE2a0UF
	SjJALSEAip9LI9RdCFbo3bwDR81s9tvHOoMyFsVeWaCElSUU6JzN+knAQCjZQELjxlkivoVrnqgzC
	zXuxlJ3FiY1w/rz6pah8g5XEzu94SlbP8hVjc0h+b76MZyngiIZYO6OIR93igeV13JEeXvSYX50x2
	jPqk+j9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1traH2-00000002F2U-2iYV;
	Mon, 10 Mar 2025 10:22:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1traEq-00000002Eqi-01Kd;
	Mon, 10 Mar 2025 10:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YVgrYAqOmzDomPVWovtiT2BUnSO4CsUu2Ru+cq5kIeM=; b=kvW9cz9v21ig5GGwO+obljcyIG
	3Dbf0AjA4WiL3kKTqq1bXf4sT2CG5at2sQ31U5gBJcE1lUesX73jySVhhgAC389jffXK3Yxia6+NS
	DcOppobmwV/9AobgdWMKG7XkySpnuEjXNd5qg3DsLtkR7ulzZBGhpf71H3XuOcZDeYguuSsPQxHbh
	dLVf/S4I4twQEB3J4DIgpUrXSr2TlLEYJgXkKl9nMtjZR+cSQO31djoaSIaamXC29hc7LlB0MkOf5
	812bkGSQlA7MqylHQCz40zc6GK0mrcnR8/t10CX7Oona9TNxg8w4koE2ljKO8809BkAL/FNf2k1XX
	m7h0bYsA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1traEm-00000001pfx-34lI;
	Mon, 10 Mar 2025 10:19:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5103C153B;
	Mon, 10 Mar 2025 03:20:05 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A2573F673;
	Mon, 10 Mar 2025 03:19:50 -0700 (PDT)
Date: Mon, 10 Mar 2025 10:19:48 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <ilia.lin@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <tiny.windzz@gmail.com>,
	<wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<imx@lists.linux.dev>
Subject: Re: [PATCH] cpufreq: Init cpufreq only for present CPUs
Message-ID: <Z868xB3_3NhMsa7R@bogus>
References: <20250310071640.3140435-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310071640.3140435-1-ping.bai@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_101956_925721_861671AC 
X-CRM114-Status: UNSURE (   8.72  )
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

On Mon, Mar 10, 2025 at 03:16:40PM +0800, Jacky Bai wrote:
> for_each_possible_cpu() is currently used to initialize cpufreq
> in below cpufreq drivers:
>   drivers/cpufreq/cpufreq-dt.c
>   drivers/cpufreq/mediatek-cpufreq-hw.c
>   drivers/cpufreq/mediatek-cpufreq.c
>   drivers/cpufreq/qcom-cpufreq-nvmem.c
>   drivers/cpufreq/sun50i-cpufreq-nvmem.c
>

Again how did you just narrow down to the list above ? Is that just a
random pick ? As I suggested with corresponding cpuidle changes, please
look into the details in side the for_each_possible_cpu() loop and then
decide if it applies or not.

For me, it applied to the below files as well at the least.

drivers/cpufreq/mvebu-cpufreq.c
drivers/cpufreq/qcom-cpufreq-hw.c
drivers/cpufreq/scmi-cpufreq.c
drivers/cpufreq/scpi-cpufreq.c
drivers/cpufreq/virtual-cpufreq.c

Please check everything thoroughly as I just looked at these briefly.

--
Regards,
Sudeep

