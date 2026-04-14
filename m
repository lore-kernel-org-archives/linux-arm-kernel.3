Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA46F9D0C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uV2E4OtysVLSUG4XWoVwDCw2mDt/pkmI+uQgA0k/IpY=; b=Ae4OZkTlwjZvQ1pI+M6hm3fbbN
	+K8ZCdL6lmvAI7V6YIEoGm8EwlC6QHq9qG1DhVDkNdSNU3RKcARrs+xPR8TRFA0g7FyWmWMAMPiQe
	L/eh782nnhBJgv/6OUKgg69pgf7ido7iXSxF75cwesgws59hV9DqZ2dTwV3agoN2GxbhCP2QUbAhk
	DoJVempm7cptabiwx4QDkHPRniz75nkvqfQhUY5Dk0fVNI8F59ZWyVXd9qJuCMzpuM2Su7YEYbGz1
	i/1PckZRKy+duIONdrUnsp3xFfONnySRo9fDxLc7cBLQbe0sxmeDRtjPzNL2sR0HFxgNF8uIiBzel
	D8+LGVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbzg-0000000HEgh-2HL9;
	Tue, 14 Apr 2026 11:31:48 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCbzd-0000000HEgF-04BJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 11:31:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uV2E4OtysVLSUG4XWoVwDCw2mDt/pkmI+uQgA0k/IpY=;
	b=GF1LAInEeqgAeqq5DYjP+nLq0xL5yYIOhCe2gEwUHcd1Vr6fcLNAKdOX8juEJunV1xzy2hPOv
	poDUU8BZ5Z8yCYpzk+SaHlmHqAZc8gH6McjPKMguh7JkZURQfdx71b8E9ZwgOB6MPsXsjenFeQR
	y5xT6Yca/6U34vqz77ed2ks=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fw24n3tyTzRhR4;
	Tue, 14 Apr 2026 19:25:13 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 561814048F;
	Tue, 14 Apr 2026 19:31:31 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Apr 2026 19:31:31 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 14 Apr
 2026 19:31:30 +0800
Message-ID: <6694ca7c-13bf-4e7d-9621-bc992cbf96a7@huawei.com>
Date: Tue, 14 Apr 2026 19:31:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] ACPI: processor: idle: Do not propagate
 acpi_processor_ffh_lpi_probe() -ENODEV
To: Breno Leitao <leitao@debian.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	<lpieralisi@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	<linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<pjaroszynski@nvidia.com>, <guohanjun@huawei.com>, <sudeep.holla@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <rmikey@meta.com>,
	<kernel-team@meta.com>
References: <20260413-ffh-v1-1-301704f69e2f@debian.org>
 <af9c679d-899c-4832-b902-e621b5987f12@huawei.com>
 <ad4UWJ__dnDQtrj8@gmail.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <ad4UWJ__dnDQtrj8@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_043145_727589_7E73CB65 
X-CRM114-Status: GOOD (  22.94  )
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


On 4/14/2026 6:21 PM, Breno Leitao wrote:
> Hello Huisong,
>
> On Tue, Apr 14, 2026 at 05:43:51PM +0800, lihuisong (C) wrote:
>> But it is a real issue. Thanks for your report.
>> I think the best way to fix your issue is that remove this verification in
>> psci_acpi_cpu_init_idle().
>> Because it is legal for platform to report one LPI state.
>> This function just needs to verify the LPI states which are FFH.
> Thank you for the prompt feedback.
>
> Would this approach work?
>
> commit 6c9d52840a4f778cc989838ba76ee51416e85de3
> Author: Breno Leitao <leitao@debian.org>
> Date:   Tue Apr 14 03:16:08 2026 -0700
>
>      ACPI: processor: idle: Allow platforms with only one LPI state
>      
>      psci_acpi_cpu_init_idle() rejects platforms where power.count - 1 <= 0
>      by returning -ENODEV. However, having a single LPI state (WFI) is a
>      valid configuration. The function's purpose is to verify FFH idle states,
>      and when count is zero, there are simply no FFH states to validate —
>      this is not an error.
>      
>      On NVIDIA Grace (aarch64) systems with PSCIv1.1, power.count is 1 for
>      all 72 CPUs, so the probe fails with -ENODEV. After commit cac173bea57d
>      ("ACPI: processor: idle: Rework the handling of
>      acpi_processor_ffh_lpi_probe()"), this failure propagates up and prevents
>      cpuidle registration entirely.
>      
>      Change the check from (count <= 0) to (count < 0) so that platforms
>      with only WFI are accepted. The for loop naturally handles count == 0
>      by not iterating.
>      
>      Fixes: cac173bea57d ("ACPI: processor: idle: Rework the handling of acpi_processor_ffh_lpi_probe()")
>      Signed-off-by: Breno Leitao <leitao@debian.org>
>
> diff --git a/drivers/acpi/arm64/cpuidle.c b/drivers/acpi/arm64/cpuidle.c
> index 801f9c4501425..7791b751042ce 100644
> --- a/drivers/acpi/arm64/cpuidle.c
> +++ b/drivers/acpi/arm64/cpuidle.c
> @@ -31,7 +31,7 @@ static int psci_acpi_cpu_init_idle(unsigned int cpu)
>   		return -EOPNOTSUPP;
>   
>   	count = pr->power.count - 1;
> -	if (count <= 0)
> +	if (count < 0)
>   		return -ENODEV;
>   
>   	for (i = 0; i < count; i++) {

This count already verified in acpi_processor_get_lpi_info.

I suggest modifing it as below:

-->

git diff
diff --git a/drivers/acpi/arm64/cpuidle.c b/drivers/acpi/arm64/cpuidle.c
index 801f9c450142..c68a5db8ebba 100644
--- a/drivers/acpi/arm64/cpuidle.c
+++ b/drivers/acpi/arm64/cpuidle.c
@@ -16,7 +16,7 @@

  static int psci_acpi_cpu_init_idle(unsigned int cpu)
  {
-       int i, count;
+       int i;
         struct acpi_lpi_state *lpi;
         struct acpi_processor *pr = per_cpu(processors, cpu);

@@ -30,14 +30,10 @@ static int psci_acpi_cpu_init_idle(unsigned int cpu)
         if (!psci_ops.cpu_suspend)
                 return -EOPNOTSUPP;

-       count = pr->power.count - 1;
-       if (count <= 0)
-               return -ENODEV;
-
-       for (i = 0; i < count; i++) {
+       for (i = 1; i < pr->power.count; i++) {
                 u32 state;

-               lpi = &pr->power.lpi_states[i + 1];
+               lpi = &pr->power.lpi_states[i];
                 /*
                  * Only bits[31:0] represent a PSCI power_state while
                  * bits[63:32] must be 0x0 as per ARM ACPI FFH 
Specification


