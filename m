Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97EEEA3F03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X671G7PKtAnhHHfVrNzs7J8ZHGMbBfVOz7V4bs5VpfQ=; b=JgsImlNVVID3yxKEOntYjcNPmU
	E/dSmEzSMXjilXM+ofam7npRj1yyk0tXbVBO6T5zOBcRM/vsQ9BC1d16PfPDPc0KLvTQNYITfQh9I
	pPy5Zuc04lS4DfvsbJnRU8iPEZ3rKDmFAILcVmsRJIxFjBEMBmEiQabc+QqXYABTh9UmzB0/tErsv
	/uxmlFT6WLWiHCGAhEpFiiEFykmINz9/eWsxHhVUo84IZTRxMh/2gWx9SDdrji0WbWjj2Ibo3NXsT
	rRBmslPpC6/X4XG7nB1+uHhP3SiCLmpeFPlzK4Lo8LBe3+HpCesYXI+6mggy7L42coI2ct3FiIY6D
	66iCSo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpfyb-0000000GRos-396z;
	Tue, 10 Feb 2026 05:07:53 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpfyX-0000000GRoP-2dQF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:07:52 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAAHsm0gvYppnPyYBw--.20020S2;
	Tue, 10 Feb 2026 13:07:44 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: Frank.li@nxp.com
Cc: peng.fan@nxp.com,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Check return value of regmap_attach_dev() in imx_rproc_mmio_detect_mode()
Date: Tue, 10 Feb 2026 13:07:44 +0800
Message-Id: <20260210050744.1902425-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aYoNI7f0OMegFBM3@lizhi-Precision-Tower-5810>
References: <aYoNI7f0OMegFBM3@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHsm0gvYppnPyYBw--.20020S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur1xKF1xCFWxCry7Zw1fWFg_yoWDXrX_uw
	4Yy3yay3WUZrWag3sruF4rta9rGa1UCFWUGw1Yq3W5Jr1UG39rGF4vgFnay3W8uFW3tr9I
	934rXw1fu3WIkjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbhAYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4F1vDUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_210750_053055_D5BF2242 
X-CRM114-Status: UNSURE (   8.57  )
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

On Mon, Feb 09, 2026 at 11:36:51AM -0500, Frank Li wrote:
> On Mon, Feb 09, 2026 at 01:14:07PM +0800, Chen Ni wrote:
> > Changes in v2:
> > - Use dev_err() + return ret instead of dev_err_probe()
> 
> why?
> 
> Frank

Hi Frank,

The replacement of dev_err_probe() with dev_err() + return ret is based
on two key reasons:

1. Consistency with existing code style in imx_rproc_mmio_detect_mode():
   The upper-level probe function already uses dev_err_probe() to handle
   errors from this function, and all other error paths here also use
   "dev_err() + return ret", so this change aligns with the existing
   coding style.

2. Technical rationale from community feedback:
   regmap_attach_dev() only returns -ENOMEM errors, and dev_err_probe() is
   silent for -ENOMEM errors [1]. Using dev_err() ensures the error is
   logged clearly, while returning the original ret maintains proper error
   propagation.

[1] 2f3cfd2f4b7c ("driver core: Make dev_err_probe() silent for -ENOMEM")

Best regards,
Chen Ni


