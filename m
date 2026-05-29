Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09A4CD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxDSLVZMz0qjcgzlgvvElM2T20yp9JAblPwMdAQLuS0=; b=gMvZ8I4MwcnHXY+yxiIAit95q5
	AGqR+v3eIdYOdlY9I6Aal8zyc1A+K/4bhm/hfy1Svdf2zEKzGH2SAD1dOCWv9wtQLucJAIWqE5c1S
	G27YsliweGkHIW+PXd7wrw/dBbqTc7lr4ln1QB4ZxlURqnF418CWVCQqsSyR2GJplP0xij0GSMMhg
	O3g31YoxGU05SkEVQCzlWdzRqHGPO+YEDTctQU6h6dm/hDuAThrePOXeZTOHr0/JyoCv8LB3PeQY0
	IiBZ0jzCwBah57fk+44IxxIY3KtvV0p1eMhl2C4ty15uzgQu8k83kKl0Qzc5sM4ynxUWO5yflhPLK
	feAHk0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyOW-00000007XRE-2tku;
	Fri, 29 May 2026 14:41:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyOU-00000007XQd-0fNO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:41:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 878451FC7;
	Fri, 29 May 2026 07:40:53 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 247A23F905;
	Fri, 29 May 2026 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780065658; bh=SaSJnQrDHy26ahs5WkmoCdUA8qqhur7vMZILhcqQpYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pQa9iw4we79cyPR7M1QBB5Qcr4ZgyPHdo+IWFUSsUwjFVyyXCW91NcFUool1WTWcz
	 E/25jC3m2pzJT2w2YxJ6QNBMws7LXlLLxZaqorWv4ySL14w8EEXnPd9vJ8Yvflv5pa
	 w7RRBLC/d4Yl7Xv8gm3nkhxhmLNwVkGxti1UyG34=
Date: Fri, 29 May 2026 15:40:55 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
	tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 2/4] coresight: cti: use __reg_addr() helper for
 register access
Message-ID: <20260529144055.GK101133@e132581.arm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
 <20260521-extended_cti-v9-2-d21f4f92c51e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-extended_cti-v9-2-d21f4f92c51e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074102_295461_F4D16082 
X-CRM114-Status: GOOD (  16.25  )
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

On Thu, May 21, 2026 at 08:16:28PM +0800, Yingchao Deng wrote:

[...]

> +static void __iomem *__reg_addr(struct cti_drvdata *drvdata, u32 off,
> +				u32 index)
> +{
> +	return drvdata->base + off + sizeof(u32) * index;
> +}
> +
> +#define reg_addr(drvdata, off)		__reg_addr((drvdata), (off), 0)
> +#define reg_index_addr(drvdata, off, i)	__reg_addr((drvdata), (off), (i))

> -u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
> +u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index)
>  {
> -	int val;
> +	u32 val;
>  
>  	CS_UNLOCK(drvdata->base);
> -	val = readl_relaxed(drvdata->base + offset);
> +	val = readl_relaxed(reg_index_addr(drvdata, off, index));
>  	CS_LOCK(drvdata->base);
>  
>  	return val;
>  }
>  
> -void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
> +void cti_write_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index,
> +			  u32 value)
>  {
>  	CS_UNLOCK(drvdata->base);
> -	writel_relaxed(value, drvdata->base + offset);
> +	writel_relaxed(value, reg_index_addr(drvdata, off, index));
>  	CS_LOCK(drvdata->base);
>  }

I prefer to move the register helpers into coresight-cti.h and add two
additional helpers: cti_read_single_reg_index() and
cti_write_single_reg_index().

I also found circular dependency between coresight-cti.h and qcom-cti.h.
Since qcom-cti.h only contains register definitions and a small inline
function for register conversion, we can simply fold it into
coresight-cti.h and dismiss the circular dependency.

Based on this idea, I played around with the code a bit (see the snippet
below). Would you be okay with applying this approach to patches 02/03?
If have any questions, please let me know.

---8<---

--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -60,6 +60,31 @@ struct fwnode_handle;
  */
 #define CTIINOUTEN_MAX		128
 
+/* QCOM CTI extension */
+#define QCOM_ARCHITECT		0x477
+
+#define QCOM_CTIINTACK		0x020
+#define QCOM_CTIAPPSET		0x004
+#define QCOM_CTIAPPCLEAR	0x008
+#define QCOM_CTIAPPPULSE	0x00C
+#define QCOM_CTIINEN		0x400
+#define QCOM_CTIOUTEN		0x800
+#define QCOM_CTITRIGINSTATUS	0x040
+#define QCOM_CTITRIGOUTSTATUS	0x060
+#define QCOM_CTICHINSTATUS	0x080
+#define QCOM_CTICHOUTSTATUS	0x084
+#define QCOM_CTIGATE		0x088
+#define QCOM_ASICCTL		0x08C
+/* Integration test registers */
+#define QCOM_ITCHINACK		0xE70
+#define QCOM_ITTRIGINACK	0xE80
+#define QCOM_ITCHOUT		0xE74
+#define QCOM_ITTRIGOUT		0xEA0
+#define QCOM_ITCHOUTACK		0xE78
+#define QCOM_ITTRIGOUTACK	0xEC0
+#define QCOM_ITCHIN		0xE7C
+#define QCOM_ITTRIGIN		0xEE0
+
 /**
  * Group of related trigger signals
  *
@@ -222,9 +247,8 @@ int cti_enable(struct coresight_device *csdev, enum cs_mode mode,
 int cti_disable(struct coresight_device *csdev, struct coresight_path *path);
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata);
 void cti_write_intack(struct device *dev, u32 ackval);
-void cti_write_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index,
-			  u32 value);
-u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off, u32 index);
 int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 			enum cti_trig_dir direction, u32 channel_idx,
 			u32 trigger_idx);
@@ -237,6 +261,78 @@ struct coresight_platform_data *
 coresight_cti_get_platform_data(struct device *dev);
 const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 
+static inline u32 cti_qcom_reg_off(u32 offset)
+{
+	switch (offset) {
+	case CTIINTACK:		return QCOM_CTIINTACK;
+	case CTIAPPSET:		return QCOM_CTIAPPSET;
+	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
+	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
+	case CTIINEN:		return QCOM_CTIINEN;
+	case CTIOUTEN:		return QCOM_CTIOUTEN;
+	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
+	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
+	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
+	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
+	case CTIGATE:		return QCOM_CTIGATE;
+	case ASICCTL:		return QCOM_ASICCTL;
+	case ITCHINACK:		return QCOM_ITCHINACK;
+	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
+	case ITCHOUT:		return QCOM_ITCHOUT;
+	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
+	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
+	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
+	case ITCHIN:		return QCOM_ITCHIN;
+	case ITTRIGIN:		return QCOM_ITTRIGIN;
+
+	default:
+		return offset;
+	}
+}
+
+static inline void __iomem *__reg_addr(struct cti_drvdata *drvdata,
+				       u32 off, u32 index)
+{
+	if (unlikely(drvdata->is_qcom_cti))
+		off = cti_qcom_reg_off(off);
+
+	return drvdata->base + off + index * sizeof(u32);
+}
+
+#define reg_addr(drvdata, off)		__reg_addr((drvdata), (off), 0)
+#define reg_index_addr(drvdata, off, i)	__reg_addr((drvdata), (off), (i))
+
+static inline u32 cti_read_single_reg_index(struct cti_drvdata *drvdata,
+					    u32 off, u32 index)
+{
+	u32 val;
+
+	CS_UNLOCK(drvdata->base);
+	val = readl_relaxed(reg_index_addr(drvdata, off, index));
+	CS_LOCK(drvdata->base);
+
+	return val;
+}
+
+static inline u32 cti_read_single_reg(struct cti_drvdata *drvdata, u32 off)
+{
+	return cti_read_single_reg_index(drvdata, off, 0);
+}
+
+static inline void cti_write_single_reg_index(struct cti_drvdata *drvdata,
+					      u32 off, u32 index, u32 value)
+{
+	CS_UNLOCK(drvdata->base);
+	writel_relaxed(value, reg_index_addr(drvdata, off, index));
+	CS_LOCK(drvdata->base);
+}
+
+static inline void cti_write_single_reg(struct cti_drvdata *drvdata,
+					u32 off, u32 value)
+{
+	cti_write_single_reg_index(drvdata, off, 0, value);
+}
+
 /* Check if a cti device is enabled */
 static inline bool cti_is_active(struct cti_config *cfg)
 {

