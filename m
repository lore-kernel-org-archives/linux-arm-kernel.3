Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDABDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 16:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gk00q0u/jy5cRCMsIyq1c6vaEAo0BemxLZU/jKzDzZQ=; b=sDBeTD009WyRgtiie6+S/MjZOL
	W113TaHh9d9HWYtSQ+Aiq8SnKi4OCdf4dSB1utrbddravYx8jpWuU9/Q4mmARAzjMD2y29oPL5xxf
	hidY0Nxq0NBTs6Ezsrw/q9MwHvDktRYgU7mUpZoYMuH4cDUJ64ft+p1bZzCfiVNCR81pV+izcP5R5
	xfp3B4Te6jdtu0/t6yUjndUSLLCyp1RRohT4JdXDXpTFNSFZ+cLxtpx60SkUiOurzIlT0aoQL2YY7
	UryQZo9x16fTQSX1CMfz3cbxVDQzW1FIMxYX/1Q9CvZcYQnE53CslW6KDLWh5Up8GNjDsCZHzNOte
	78CbtS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjPV-00000008y1o-1YGA;
	Tue, 14 Jan 2025 16:04:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjOG-00000008xja-0Ita
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 16:03:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 073C612FC;
	Tue, 14 Jan 2025 08:04:08 -0800 (PST)
Received: from [10.57.35.117] (unknown [10.57.35.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B4C0A3F673;
	Tue, 14 Jan 2025 08:03:38 -0800 (PST)
Message-ID: <ae66124f-e839-4696-8d84-7be44e7e5ea9@arm.com>
Date: Tue, 14 Jan 2025 16:03:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight-etm4x: add isb() before reading the TRCSTATR
Content-Language: en-GB
To: yuanfang zhang <quic_yuanfang@quicinc.com>, mike.leach@linaro.org,
 james.clark@linaro.org, alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241206080240.59313-1-quic_yuanfang@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241206080240.59313-1-quic_yuanfang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_080340_210102_25274C70 
X-CRM114-Status: GOOD (  31.99  )
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

Hi Yuanfang Zhang,

On 06/12/2024 08:02, yuanfang zhang wrote:
> From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> 
> As recommended by section 4.3.7 ("Synchronization when using system
> instructions to progrom the trace unit") of ARM IHI 0064H.b, the
> self-hosted trace analyzer must perform a Context synchronization
> event between writing to the TRCPRGCTLR and reading the TRCSTATR.
> 
> Fixes: ebddaad09e10 ("coresight: etm4x: Add missing single-shot control API to sysfs")

This looks wrong. This should rather be :

Fixes: 1ab3bb9df5e3 ("coresight: etm4x: Add necessary synchronization 
for sysreg access")


> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
> Changes in V3:
> 1. Remove dsb(sy) after polling TRCSTATR.

Please separate this into a different patch.

> 2. Add isb() after polling TRCSTATR.
> ---
>   .../hwtracing/coresight/coresight-etm4x-core.c   | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 66d44a404ad0..c6ea00bba0cc 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -531,7 +531,6 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   	 * As recommended by section 4.3.7 ("Synchronization when using the
>   	 * memory-mapped interface") of ARM IHI 0064D
>   	 */
> -	dsb(sy);
>   	isb();
>   

This should be a separate patch, as the main issue needs to be ported
back to stable.

>   done:
> @@ -906,10 +905,25 @@ static void etm4_disable_hw(void *info)
>   	tsb_csync();
>   	etm4x_relaxed_write32(csa, control, TRCPRGCTLR);
>   
> +	/*
> +	 * As recommended by section 4.3.7 ("Synchronization when using system
> +	 * instructions to progrom the trace unit") of ARM IHI 0064H.b, the
> +	 * self-hosted trace analyzer must perform a Context synchronization
> +	 * event between writing to the TRCPRGCTLR and reading the TRCSTATR.
> +	 */
> +	if (!csa->io_mem)
> +		isb();
> +
>   	/* wait for TRCSTATR.PMSTABLE to go to '1' */
>   	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
>   		dev_err(etm_dev,
>   			"timeout while waiting for PM stable Trace Status\n");

Additionally, we need an ISB between the each read of TRCSTATR (in
coresight_timeout() above), as per the secion 4.3.7, Synchronization
when using system instructions to program the trace unit, Note secion.

Please could you fix that as well ? That would require, changing the
coresight_timeout(), or add something on our own here for etm4x driver 
to do that.


Something like (untested):




diff --git a/drivers/hwtracing/coresight/coresight-core.c 
b/drivers/hwtracing/coresight/coresight-core.c
index 0a9380350fb5..f579181362b4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1092,18 +1092,20 @@ static void coresight_remove_conns(struct 
coresight_device *csdev)
  }

  /**
- * coresight_timeout - loop until a bit has changed to a specific register
- *			state.
+ * coresight_timeout_action - loop until a bit has changed to a 
specific register
+ *			      state, with a callback after every trial.
   * @csa: coresight device access for the device
   * @offset: Offset of the register from the base of the device.
   * @position: the position of the bit of interest.
   * @value: the value the bit should have.
+ * @cb: Call back after each trial
   *
   * Return: 0 as soon as the bit has taken the desired state or -EAGAIN if
   * TIMEOUT_US has elapsed, which ever happens first.
   */
-int coresight_timeout(struct csdev_access *csa, u32 offset,
-		      int position, int value)
+int coresight_timeout_action(struct csdev_access *csa, u32 offset,
+			     int position, int value,
+			     coresight_timeout_cb_t cb)
  {
  	int i;
  	u32 val;
@@ -1119,6 +1121,8 @@ int coresight_timeout(struct csdev_access *csa, 
u32 offset,
  			if (!(val & BIT(position)))
  				return 0;
  		}
+		if (cb)
+			cb(csa, offset, position, value);

  		/*
  		 * Delay is arbitrary - the specification doesn't say how long
@@ -1131,6 +1135,13 @@ int coresight_timeout(struct csdev_access *csa, 
u32 offset,

  	return -EAGAIN;
  }
+EXPORT_SYMBOL_GPL(coresight_timeout_action);
+
+int coresight_timeout(struct csdev_access *csa, u32 offset,
+		      int position, int value)
+{
+	return coresight_timeout_action(csa, offset, position, value, NULL);
+}
  EXPORT_SYMBOL_GPL(coresight_timeout);

  u32 coresight_relaxed_read32(struct coresight_device *csdev, u32 offset)
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c 
b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index dd8c74f893db..c60f145bffe2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -399,6 +399,29 @@ static void etm4_check_arch_features(struct 
etmv4_drvdata *drvdata,
  }
  #endif /* CONFIG_ETM4X_IMPDEF_FEATURE */

+static void etm4x_sys_ins_barrier(struct csdev_access *csa, u32 offset, 
int pos, int val)
+{
+	if (!csa->io_mem)
+		isb();
+}
+
+/*
+ * etm4x_wait_status: Poll for TRCSTATR.<pos> == <val>. While using system
+ * instruction to access the trace unit, each access must be separated by a
+ * synchronization barrier. See ARM IHI0064H.b section "4.3.7 
Synchronization of
+ * register updates", for system instructions section, in "Notes":
+ *
+ *   "In particular, whenever disabling or enabling the trace unit, a 
poll of
+ *    TRCSTATR needs explicit synchronization between each read of 
TRCSTATR"
+ */
+static int etm4x_wait_status(struct csdev_access *csa, int pos, int val)
+{
+	if (!csa->io_mem)
+		return coresight_timeout_action(csa, TRCSTATR, pos, val,
+						etm4x_sys_ins_barrier);
+	return coresight_timeout(csa, TRCSTATR, pos, val);
+}
+
  static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
  {
  	int i, rc;
@@ -430,7 +453,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
  		isb();

  	/* wait for TRCSTATR.IDLE to go up */
-	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_IDLE_BIT, 1))
+	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1))
  		dev_err(etm_dev,
  			"timeout while waiting for Idle Trace Status\n");
  	if (drvdata->nr_pe)
@@ -518,12 +541,14 @@ static int etm4_enable_hw(struct etmv4_drvdata 
*drvdata)
  	/* Enable the trace unit */
  	etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);

+	if (csa->io_mem)
+		dsb(sy);
  	/* Synchronize the register updates for sysreg access */
  	if (!csa->io_mem)
  		isb();

  	/* wait for TRCSTATR.IDLE to go back down to '0' */
-	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_IDLE_BIT, 0))
+	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 0))
  		dev_err(etm_dev,
  			"timeout while waiting for Idle Trace Status\n");

@@ -531,7 +556,6 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
  	 * As recommended by section 4.3.7 ("Synchronization when using the
  	 * memory-mapped interface") of ARM IHI 0064D
  	 */
-	dsb(sy);
  	isb();

  done:
@@ -907,7 +931,7 @@ static void etm4_disable_hw(void *info)
  	etm4x_relaxed_write32(csa, control, TRCPRGCTLR);

  	/* wait for TRCSTATR.PMSTABLE to go to '1' */
-	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
+	if (etm4x_wait_status(csa, TRCSTATR_PMSTABLE_BIT, 1))
  		dev_err(etm_dev,
  			"timeout while waiting for PM stable Trace Status\n");
  	/* read the status of the single shot comparators */
@@ -1711,7 +1735,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata 
*drvdata)
  	etm4_os_lock(drvdata);

  	/* wait for TRCSTATR.PMSTABLE to go up */
-	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1)) {
+	if (etm4x_wait_status(csa, TRCSTATR_PMSTABLE_BIT, 1)) {
  		dev_err(etm_dev,
  			"timeout while waiting for PM Stable Status\n");
  		etm4_os_unlock(drvdata);
@@ -1802,7 +1826,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata 
*drvdata)
  		state->trcpdcr = etm4x_read32(csa, TRCPDCR);

  	/* wait for TRCSTATR.IDLE to go up */
-	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_IDLE_BIT, 1)) {
+	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1)) {
  		dev_err(etm_dev,
  			"timeout while waiting for Idle Trace Status\n");
  		etm4_os_unlock(drvdata);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 17276965ff1d..03dd53fe724a 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -649,6 +649,10 @@ extern int coresight_enable_sysfs(struct 
coresight_device *csdev);
  extern void coresight_disable_sysfs(struct coresight_device *csdev);
  extern int coresight_timeout(struct csdev_access *csa, u32 offset,
  			     int position, int value);
+typedef void (*coresight_timeout_cb_t) (struct csdev_access *, u32, 
int, int);
+extern int coresight_timeout_action(struct csdev_access *csa, u32 offset,
+				    int position, int value,
+				    coresight_timeout_cb_t cb);

  extern int coresight_claim_device(struct coresight_device *csdev);
  extern int coresight_claim_device_unlocked(struct coresight_device 
*csdev);



> +	/*
> +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> +	 * of ARM IHI 0064H.b.
> +	 */
> +	isb();
> +
>   	/* read the status of the single shot comparators */
>   	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
>   		config->ss_status[i] =


