Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419E1C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hC4tsXY7Tn8f9AYfjvECYAdjTMrX5zvDSdSMGlCzQyw=; b=oUA+umFu2hI8g2S5chmcM4NSh3
	5S6IhFJ4WEtkYOCx+c0S6yYao83vVZvRiZHSq390cnL1LGqBpa7Hb72JVGsyuj0A6qcCSfS+AbKyz
	5ygdA34rd8f7GBhGL4KrG/xD1aV6jzwStB40fWraZYdwWrxdJSKCjPHU5k5tT1RvCI/ji2Ichn5mE
	rl8scwzl9g1LpL6dKkZaC94Hb31l/kPOPZBN9yxdk2ZZ1TRapWOzijwZN4Y1PC/shKS8GghC9dJkW
	qxv1VcQB17eeMHRap3VK5ovtVT4vjaRw9TZE+LY8eNEQ50gZxWq2l2o+5JFUN6Bi+zpJV0Xh+uXY7
	4Wr5bo+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYo3-0000000HDAH-2b3d;
	Mon, 24 Aug 2026 17:49:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYo0-0000000HD9p-3HFx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:49:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OFn1JV2261385
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hC4tsXY7Tn8f9AYfjvECYAdjTMrX5zvDSdSMGlCzQyw=; b=LSLREBkTuhBvVODP
	eWe6LVgwJP2xBGXNeJVCkEecomyec/PmJhicfIbENRXwAGA+/56bbLwBwmINStC6
	Bdo0lcLYqiduXHSks2B9N0iw6UarCrV7ST6SJaeq5To6095iWFagb+VVMyOvZgXw
	z3YLjkdooErj87oSPQowZS706yRxBOexCvfyF/ApcXFO71ifdzhcfPychLqDXDzz
	ZN6/6HSr7wwafpLr039XoU72/I1X01XWtU22mgSH/ejCrGYKxBDXv+MkBKlbcXNU
	wGeg8NPRf0kcY4VFQnSMHtVHo8/9bGGsiqZbn2LbatFmoueUzEFEd8LqVcP9GNrx
	Thk57w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf2mm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 17:49:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so58357635ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 10:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787593793; x=1788198593; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hC4tsXY7Tn8f9AYfjvECYAdjTMrX5zvDSdSMGlCzQyw=;
        b=B4EMBSoqvkYwQSqTT3lyyLO8xlh+90OEilihuOqEyTfnS1aRlJXkijowOh67wj7qOz
         xxxP3AEMEXjaeLpp1WBevOrVWebYK2bY29RrMi/PBegZNnYIryQVnGT8u00sidAflx/y
         yOWvKtn4CNMQ4BBwuhH5qTM6CXSYfzqOVPhMiXLPrPzP3xm/f759o7pkU6phIi8VFRpv
         o1rjq6yTChEzdDJvBjH8S/8tm64Sj4D1aW3PtcHauTrhB6/OkTJ7ClJulQ/uRTjr67+3
         wak2LQ4fIaQ3TS/TtH8Cy0CgNBV+c6ecO1g4/JIAwt14ysoDEC1XKPSO4MNAb7pgGYfN
         fa1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593793; x=1788198593;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hC4tsXY7Tn8f9AYfjvECYAdjTMrX5zvDSdSMGlCzQyw=;
        b=j96y2bgXz0jRJyy8iEwzD03gz6LztVQMKwjN8nku7l92uNJceymmjlHqgGnunfOMOj
         aDOLIFp/WLgr2SKtSYpYLgPTAi0tDampHHAl7FajfebWjnHkt5teZYCDIux45OHZ3cJy
         VBrgQmUFHnYikG6cx3MAHobczNQfAFo3p9oBqFkojdiEtVpTD5AR90jJSD+WNg/gu6rR
         c/20XwLwXZo3+Kkbf+2J+UodaV5EVuU5xluUUR0XkMYrZlEbOXV32IW744G9m9GWKDi/
         FcmeOexDQNisHLA+sL2ipqLQihjQ9Dpz1VTu6PeEY0RDsbMojl4p0o13Ry027YKTV0Ep
         DwKg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5uDykyiTdAM45MtA2fSxNSbejXg9RlTmqzmvbYjZOeP8fKDnlfNt+fSOrFeBYITxYwtdAgnbc3ZsnFkiY1GaO@lists.infradead.org
X-Gm-Message-State: AFuF++nsWEpVuUusbW8qt79erSlb7OuvdEQLgjXRnjEsoQuuHom3XHuM
	tYIZsbOJrXNSTCTyE4cXkteffbRMkzQC48M+5Mto5KDIAsgWLPEDFK9zX92qspPgqsyND9/4fof
	XaPsWKQTOp1OZ+Qp5F+sgtQ7PKHLcROybpvQY+kfMz3zU5xNvHSuXQSJrLZtXVCpAiBVqez1mix
	UpvA==
X-Gm-Gg: AR+sD11SGMenG1Yh0VaRNxLy8jyORO3w/47VMrYodouZf92H24l0Hk1Gdf3VF4GvJM0
	wzrPgsNwiz+8ngikIDJzCt7fXeKW4lSLGhKeGF2SaCQHOvySTnxN045GmL1wdmGnG+6Aq4SMom+
	R/BWRehGSiRfje+9pDfk8VZddpD/3bkPhCg47GzDBY3Rg18WSG5vuFg9xgc9ciY48GGwuAT6kk1
	Gncm829Cmz0IevXpi9rr51NMOLcFbFaUbZmUVyiDtFNkpolTbWEG0QDn/lA3ybPVAsgXc4clH4K
	b2NpcF1wWwBkDaakkcOgcqnNll3+DwV3N++d+5VXkNKxM5GPyhSq7HaF24HjS8P6h2teYTDyjpS
	i95Pi6BhKQsgK5apDjkxhxBvFAQ==
X-Received: by 2002:a17:903:32c3:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d6dcc248c5mr14169455ad.13.1787593792997;
        Mon, 24 Aug 2026 10:49:52 -0700 (PDT)
X-Received: by 2002:a17:903:32c3:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d6dcc248c5mr14168725ad.13.1787593792583;
        Mon, 24 Aug 2026 10:49:52 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm30555960eec.7.2026.08.24.10.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:49:52 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:49:48 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 6/9] firmware: arm_scmi: Refactor protocol device
 creation logic
Message-ID: <20260824104948.0000454b@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-6-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-6-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE1MCBTYWx0ZWRfX8ZazPiTQXFBp
 rqZLIBYmJPZHfo8RxMMRh9SwaAaZtqwPUvQhgXDOsZmU59pJx0daLb7xTMfgo7SdezQuLb7slSV
 uqZJnbtDPcoX9cc5kXRsqiOx68VAmV8=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c8442 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uSDrWeKFmoLr1Pkb7YkA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 0ryMrej7rnJy_16D5LK5V-cs1Kk9qQpx
X-Proofpoint-GUID: 0ryMrej7rnJy_16D5LK5V-cs1Kk9qQpx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE1MCBTYWx0ZWRfX6SEVkTJ9/1oV
 XYBZi3+mf1O6dVlqxv8O3lKyH6YHD19XslQSicSxb9c703nvTqR877c56il5O4JV1vFRhsGRqbd
 4FdE+wOSZwCtc5zWxeeQOsftOhVUuGSdDx8ZET18bjuFHc6tuZjUriGPP/5Dv+ENcKOUXR+DdRz
 5ZBeap08O+/ggRLJvVH5oMWH6wCLNfzwhE0rZBdp0NAC5tBwAGHWWkUeJ5a12PjsVf0NreJyKL4
 dq80juSR7qd0dGEBj9FIGxaTDNKeGDJdscXnVK89HKpZ7x0bPR+xSo0/lHTSDQGy4RG0OowdD94
 CfzAFP3YI6Qt+0plv8e8wRqDm4pT0xThuurnQ55fNN+fkdEF3Ax1kRWYQUc4ZGQYTV1vDopdCk4
 WkQf+ywWhT0KOKIvhFG2Bn9RPrBmtHFN4A6lUy0wGQbGgNgjaYhbgKogBlo34/gUgaNXeMH9bQC
 MFMCSnxE/730rHk4xEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_104956_943926_9EF84230 
X-CRM114-Status: GOOD (  25.86  )
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

On Thu, 13 Aug 2026 12:33:01 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Move the protocol validation and device creation logic in scmi_probe()
> into a reusable scmi_device_check_create() helper.
> 
> The helper centralizes checks for the protocol ID range, implementation
> availability and duplicate activation before invoking
> scmi_create_protocol_devices(). This preserves the existing behavior
> while allowing the logic to be reused by the ACPI path, where protocol
> child fwnodes are absent.
> 
> No functional change intended.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
A trivial thing and one follow on from earlier.  For that just be consistent
with what you choose to do for the earlier comment.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_scmi/driver.c | 60 ++++++++++++++++++++++----------------
>  1 file changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index aad678db0f6e..951ba3df6ba6 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -3244,6 +3244,40 @@ static void scmi_enable_matching_quirks(struct scmi_info *info)
>  			   rev->sub_vendor_id, rev->impl_ver);
>  }
>  
> +static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
> +				     struct scmi_info *info)
> +{
> +	int ret;
> +	struct device *dev = info->dev;
> +	struct scmi_handle *handle = &info->handle;
> +
> +	if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
> +		dev_err(dev, "Out of range protocol %d\n", prot_id);
> +		return;
> +	}
> +
> +	if (!scmi_is_protocol_implemented(handle, prot_id)) {
> +		dev_err(dev, "SCMI protocol %d not implemented\n",
> +			prot_id);

Fits on one line. I didn't check if you modify this later in the series
though so if this is churn reduction, fine to leave it as it stands.

> +		return;
> +	}
> +
> +	/*
> +	 * Save this valid fwnode protocol descriptor amongst
> +	 * @active_protocols for this SCMI instance.
> +	 */
> +	ret = idr_alloc(&info->active_protocols, fwnode,
> +			prot_id, prot_id + 1, GFP_KERNEL);
> +	if (ret != prot_id) {
> +		dev_err(dev, "SCMI protocol %d already activated. Skip\n",
> +			prot_id);
> +		return;
> +	}
> +
> +	fwnode_handle_get(fwnode);
> +	scmi_create_protocol_devices(fwnode, info, prot_id, NULL);

If you take the suggest I made earlier to make the hand over of ownership
slightly more obvious by using the return value of fwmonde_handle_get()
then applies here too.

> +}

