Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB51C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qfn2cECZLsHqprJcGxd/mBRupQRn27rJQwENTMwC0N0=; b=P/SwbNRIGdnqJFVFS6INIgLBE1
	03ieE+2NZP+bStu6Dbo10MHJv1AJchbGn4fFMjVOyog7JjwP5WF889/HH3Q9KJ5st+DBd08IHz9LU
	T1wijJqf9coavmgvZu+iLKsK9BJ4pQjXtCbie0AOYpUiEATulrK24uc+6++anlz778Oc2Zz++rMmP
	VSq4nZMdIvz1MH30gwefYO8iuGDvjEUrPfTsur8RBqfujiDkp11PdEVAsu4/kDPxXU3Z99YoiOIjz
	/bo2UivWG+0ArMsgYL58DclaOOD3E0Xapo7uyh+R9PngoiZ5agxjiYTWjZptubI/mMGUBo8FZvT5Z
	64A2MvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWCQ-0000000BD9i-1ATt;
	Thu, 30 Jul 2026 19:13:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWCN-0000000BD98-2aTy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:13:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UIOW7m1879359
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 19:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qfn2cECZLsHqprJcGxd/mBRupQRn27rJQwENTMwC0N0=; b=QmqRE2syTkGqVp9U
	uOsp8jix3o5QgYKCMjAHgzo6ebANTU+LlQ6d9MqDBzdNzzceBFWaS6ANREc/dEmL
	WCTPheBvT/xBmrJkJZ8hOxvsUdF8Jnw7IDs/WAWfHaZygXQPzg1C5furt75rbPlw
	XyxP9vwXDhEQuNeX2LmZHn+n0WM7IdnjH8sBGCDhkZe7BaTTj99xh0TJy5QuzPao
	HTIMfMZr2Ql7im1ZcqY+udr/rEfXAy2YYYdNk20WeeaCQJrEA4RrO3o6fYqTYynW
	G3zK0DmUG+repXAQO5VjvC7c7dXoVCry8nk1Il/GhgY2cpU52jxrkMGEgHTvRqHX
	rFjAxg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frbv5075j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 19:13:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf6acd760cso1132245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785438821; x=1786043621; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qfn2cECZLsHqprJcGxd/mBRupQRn27rJQwENTMwC0N0=;
        b=jjn1rQyNM58frcK1tZBmikW7fv+ETb/OltYJLcO1OgUMEqMzG79wECUqwIYxnGaENq
         LOWdR/xwsVbexQh07GJsu1JCfOKwpRUCu40pXr4AiPnzta7R0cNeRQQ+MNHcMssq+r+B
         9aK78ggTS4pkZ3upP5K7Ppk9wHq6S41vCnOjgG4YecLcHqWb2smeg7yti04+V2Me+KlD
         RkBy4gtH1rl3wnk9m69cAVeZ86BK4EzJMIqgXWpl1OGNuue9K5toYGjs7mDozX6oTCDe
         ExegoAN+OBKsQjQlCoerjHrXf1Peq+s5f/YQ4/sOL/5AATKB+PKMpRCgjvUw/kf1oMKv
         8jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785438821; x=1786043621;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qfn2cECZLsHqprJcGxd/mBRupQRn27rJQwENTMwC0N0=;
        b=hrmo3PV7eM0DrgUglX9P+bxQrPin17gDcw6yx1zIjjDOAsC3yNMy1SEj7+pnTq0udo
         GEdkZW2TeB0jqFmfVWLQjWPsYPOo7fMprj1iTEwBXBMtpelLsai9Hhm/uRhF+MNflXXz
         roDofwCY5uaoDF1letH84pyuRhfWDJxEKZQGz/94LLuvRfcGSLhee87qirjFMKnODYcp
         AEv1/VgZFnJ9iIhpLvkpw8gVc7TgjnR7TybllGvz00oOak65QssnnOmtAO34NM9meWkm
         TvdhsCQAIGu2vvaRS5jRRlL4iYyxxOFdg4XQu9cVYCN4H7eYuEKnjzXEN6v7JOqt6t7J
         9R7w==
X-Forwarded-Encrypted: i=1; AHgh+RotEPSKN1unB6yHLmDL9k6uUnV3+G6M9cLLrX+wYHshhhHKdq0OR5jBjt1G1WQCwns7drZr9AtLvhD7wUk8Lotl@lists.infradead.org
X-Gm-Message-State: AOJu0YzHDyHxyenCx+RGQgAR/HqL50iFyPaOAvsLJxtKLttHbgUj/fZn
	A/2pT4Lz7UMU2jCel6JG8/xOveKZYnG3vkFhIJPcQ//9tb55EhYl8Qw9I7QDA2hyvSfWaxfLI2W
	xLJiDzQvcxdnJA3MMrc2g5BDXeSDGuEkGYSGPjpNnlXS4fsbT1yLOGHDRQ6XV4fhWGEe2rac15Z
	Xktw==
X-Gm-Gg: AR+sD10L28VvdXEsgVOIdWDJwmlU4Zd7Qx8wFgMqTQ+qx2sTRLlwqBjSxukve1DR38g
	BSciLL8HilBJvBtzlqDHcPyMpzDeuzokXVkXL7eAOHDUgqJohLnoHyFXIOTzCk89f1aovVc9wc/
	f+SA/v1SimfbcX4vHIWc8l/0Vfk0YxUeJ11ta6kd4DrMVTtR9vCAMc90OHCFcdKZL4n9pPJcaWt
	/0N31bjB/FNRIugTYj4a7G2jaq3nxxGzTg3soxrrjVmXnwbdtTp65CwblN2H9nsD3QB9UaZjZG1
	D3T14Gxe+PFmiuwzLqH2REzx+hxmWcALjEgyf/MuPu5D889OaTM+bx8GdkvPgsdw8WY2/iZO7jh
	0f2OVulJnB8K6HgBCVN6NVvcScw==
X-Received: by 2002:a17:903:2f8f:b0:2ce:b8c5:5de3 with SMTP id d9443c01a7336-2d035e50f61mr33614665ad.36.1785438821186;
        Thu, 30 Jul 2026 12:13:41 -0700 (PDT)
X-Received: by 2002:a17:903:2f8f:b0:2ce:b8c5:5de3 with SMTP id d9443c01a7336-2d035e50f61mr33614395ad.36.1785438820777;
        Thu, 30 Jul 2026 12:13:40 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504dab154sm26198193eec.26.2026.07.30.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 12:13:40 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:13:36 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma
 <ritwick.sharma@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 09/10] arm_mpam: change MPAM-Fb error IRQ to use a
 threaded IRQ handler
Message-ID: <20260730121336.00002130@oss.qualcomm.com>
In-Reply-To: <20260730152539.2712312-10-andre.przywara@arm.com>
References: <20260730152539.2712312-1-andre.przywara@arm.com>
	<20260730152539.2712312-10-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NRqiEzffVcwTWg-_x-EXqRizznFbY_T5
X-Authority-Analysis: v=2.4 cv=RcmgzVtv c=1 sm=1 tr=0 ts=6a6ba266 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=Ah_BjpGRzk7GCQLzXeIA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE0MSBTYWx0ZWRfX77JAb6S23WAo
 AxGMw5MeLU+2AUrbfFRGmqv0PT0JJJA5usFKSq9uBB9dVdbs+dsViXzeXyAqny3jcQ69hFaONfx
 c6E+JDk7PBpCcUG+sbDIE6wvCPlnblhk1pm0ocVI1KVRouiWcwDn7di0z0Mvy1eAYn+/kxKxcIo
 oGn2a7m7WxcylP72JzwMuVA+2ONlpa9JxmA2E4d2df+AySu+xxYIv0xAKT2mT2wH9rbKnlAiYc9
 OnbDiECZxMqM7hldqoUMLxPug3/ocTNjXkw0KT6qsIDjNk5TgXLQOL7MQLRSE7OWJgE/tiSCnia
 oGrtVpkagiYa2Q8R7rEcurv/colWUgczKt1dIH7TWbPCZbG8w7XhWNirLXtXyUkixaSIMkUXA4K
 jyE23O14h8nzF7f9pKIBwJ6QWbFitK6u7MctdGkAsNM15GkZkqBa9VseWYAV3J1i31XM7GLLS1z
 tb4RCcmEr7nuH3yFtPQ==
X-Proofpoint-GUID: NRqiEzffVcwTWg-_x-EXqRizznFbY_T5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE0MSBTYWx0ZWRfX4EW2BmrwgX5U
 hMPnJBfGEdV58DTQYXKw9Tlcq7PPOjul1cfprMovi2DyISPw3O4OvRLniMhxHQ00emUDkzsveIz
 tS5d6vF2iR0pYpVtHGLGdDG+6vLMk+4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_121343_799800_07CF3E0C 
X-CRM114-Status: GOOD (  31.66  )
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

On Thu, 30 Jul 2026 17:25:38 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> When an MPAM MSC gets into an error condition, it can trigger an error
> IRQ. We cannot really do much about those errors, but we at least query
> and log the error, then disable MPAM functionality.
> 
> This error report relies on reading the MSC's error status register
> (ESR) in the current hard-IRQ handler, which is not possible for MPAM-Fb
> based MSC accesses, since they involve mailbox routines that might sleep.
> The same is true for clearing the interrupt at the source, which requires
> an MSC access as well.
> 
> When an MSC is using MPAM-Fb, change the error IRQ to use a threaded IRQ
> handler, with an empty hard IRQ routine, and doing all the MSC accesses
> (to access the status and disable the IRQ line) in the threaded part.
> The change is minimal, we just check for the first MSC access error and
> bail out early. MMIO based MSCs keep using a hard-IRQ handler, since
> they must be at least non-migrate-able when doing MSC accesses, for the
> CPU affinity check to work.
> Also forbid per-CPU interrupts (PPIs) for MPAM-Fb, as we cannot use a
> threaded IRQ here.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

One thing below.

> ---
>  drivers/resctrl/mpam_devices.c | 64 ++++++++++++++++++++++++++--------
>  1 file changed, 49 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index daaf3cf48475..606ae4af2be9 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c

> @@ -2747,9 +2766,24 @@ static int mpam_register_irqs(void)
>  					       &_enable_percpu_irq, &irq,
>  					       true);
>  		} else {
> -			err = devm_request_irq(&msc->pdev->dev, irq,
> -					       &mpam_spi_handler, IRQF_SHARED,
> -					       "mpam:msc:error", msc);
> +			irq_handler_t hard, threaded;
> +
> +			/*
> +			 * MPAM-Fb needs a sleepable context for the MSC
> +			 * accesses, whereas MMIO requires at least a
> +			 * non-migrateable context for the processor ID check.
> +			 */
> +			if (msc->iface == MPAM_IFACE_MMIO) {
> +				hard = &mpam_spi_handler;
> +				threaded = NULL;
> +			} else {
> +				hard = NULL;
> +				threaded = &mpam_spi_handler;
> +			}
> +			err = devm_request_threaded_irq(&msc->pdev->dev, irq,
> +							hard, threaded,
> +							IRQF_SHARED | IRQF_ONESHOT,

IIRC correctly you'll trip a warning message for the case of MMIO and marking
it as IRQF_ONESHOT. See __setup_irq()

That was a fairly recent check to be added and caused all sorts of problems
with cases similar to this one where the handlers are coming from variables.

Upshot, you need to call appropriate registration function.


Jonathan




> +							"mpam:msc:error", msc);
>  			if (err)
>  				return err;
>  		}


