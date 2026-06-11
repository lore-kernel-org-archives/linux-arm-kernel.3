Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B48CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 10:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs6iyuQkonYMhtr1jt8Wuq4IvNl34jXhaz18EQRcVOg=; b=3n7XJcL+1U8dfBH/g5F3WBEI7F
	edq8czba2tNKJb8bKix8as0J+ai1IRUp2eSdaKXfoPJMApIddaBj7FMmn41D081vWlipKIDxBVi99
	Nrpw+CXSAvwSaOiA/raaNookKLttHE9wdNC/5YL7JqhsB1nD/qbpxCAP71tO0vAfQzb1z86syMviR
	NvRM+g4gqMKNVGTxav/otsuABshQuactRbeze3rr0D+k0ebaVyeUfkkIqD1oUVTvuBRQDX7oW7Wct
	yMnKg4AY5Uiext9kBiR5nd+B8Yz6jNwY0Mfh7Klk77GEPG+PXxRn5iadg8pTapH/rAvt8YKzgEpwa
	8PQw2x6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXd4C-00000009GCn-2Lgb;
	Thu, 11 Jun 2026 10:55:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXd47-00000009G9g-2KwQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 10:55:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA1n6R271411
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 10:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bs6iyuQkonYMhtr1jt8Wuq4I
	vNl34jXhaz18EQRcVOg=; b=DOc9/jHfdoUnMtuWTa/KyYyB+1IpWcYXQXIBSS0W
	R41e+4sP3sBHT8A/DIq0GJA69tazRJ90WXuk0jHktfCa12OgF3OciVifXUcuOPYe
	tP6jClD+NKSqx27k1NI1prV9it3hRo2gjLVvCdKEEHlXIaqLzUZO/ZzhTGB/E7iF
	CULfTloPrIH7A+tgNlbftnsGwUXOdwnu3DyIOrW2adCBHj9bcZzcxEogfTbGs2t0
	c1g5jiGLqgx1SeXdYdOQPnOPGQprbErssrwGVDjsElCJMPAwV910VD57s+qFjZoM
	6zzJeb/VrRqLrLaj8aK1ZMB3qtv4wThqSXpSHGT6UVgplQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71k4k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 10:55:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8422ca754d8so5558377b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781175313; x=1781780113; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs6iyuQkonYMhtr1jt8Wuq4IvNl34jXhaz18EQRcVOg=;
        b=FnYNRlLnCoTiMfg9sm2XFvW6YM2Qg1ZJLTg3sZIDe88oWOwBnYISGf6WNOzh8HcFB6
         vfvfdA9wtJ/zIj5mOU6zKJBNs6xlPe7eHbsKzChAal0/Z1hHywjFm2Y35KqH7PVLQiFd
         iHAUSl+s4/z1QsfyVm0Q2FGzbZ3bItoRT4H9UqdPfTBbv5UAUpYksUeSZ1bCJNVfOTwj
         7heVs9knIBcpvVNzr7GW5Ful0d2LhkSOcMhVqLSUWkxPT9QEFArMk2doo9Cm9qon8Dyf
         kYGeSPImTb/5GySTzT06ffstwBYD7koT/evupOODmidpHehBB9lNrOY/StGqtBzpzWF5
         RLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175313; x=1781780113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bs6iyuQkonYMhtr1jt8Wuq4IvNl34jXhaz18EQRcVOg=;
        b=QYZBYp8LfLEiWc1QpHqizxPtUOqM5Awjxc8mOODuiEv7cAlpwQQhY8sriOj7dd/mqM
         1gNVcQeEI9r9Ram1SxFLlsMq+VeZPM8dTX3RF1BgYW3a4kdP85ct0jL+Rq96cfeeLFhY
         xJNjcsBBclE3SCT6Uy1BVL3o5ziPoXSzD/4mxcflE88dsI1CR9vdWy78x+5nVPedhAlH
         6rePIxKSKzT0yx+oSDeL48iml4dXI8pkASx80UnjxlzRYlbWGuZ8YJkvE7ahT8aGm6l5
         1LQ7nQ50tsIF4MfcfcB3Q9b9scnpR0fWg5It68NDmd0eLMwjy4yORkv0WVMkyLh9O92X
         GKFw==
X-Forwarded-Encrypted: i=1; AFNElJ83+4z7TehWjUURaxEITWk2DGb33pNk8FlGzkRdSGGSHsLnSWiapgfAu84pqYdfCj7U5hcisOgrxUyLWsM7yfVX@lists.infradead.org
X-Gm-Message-State: AOJu0YxIfw/QF4Ii7C4Q8EhumMKn8p15kE8uuJSeB/bAOa+2IIFXjnRp
	oVmhocdFh/yWR4o15fGvnlz9yrdwVQ/NUiCVwMX2DeX+zuFY0VShvB6wYadp7jol8bYMT7F4cKs
	/YCYqzwez7vnWGE0WCpUK4rWZvDo0cRAeECS9YJKuE5w2ZMWkBHxQDlnlpOtBcHdqmkTJ/hRKS8
	f76A==
X-Gm-Gg: Acq92OHWrA3arh2cJdV9bq0acVyvCd2/b0UY9pQKxm92sJEe6XWiMHzOPZjiGI1Cq8e
	NUTpWZ0wTfNNG7qcClETVz+fHHZH2ZTs96TXAAfLtYkmifnme/fJDwl3YN6AfvT97yfl9/pDQ7V
	ZzyMqERZpwUfKB369+HDXHQWsiHtOFsFXM89YtvhUAIifapwytmGlszfenQSEI3/DDt3M4E3RjY
	FPYGk1nXsyNl01oKwONjpxmh82xbMNvL0oY99RZf0rTzcMHmN3ycM6t5GzX5QqOpMofVWSTGzJ7
	7IWWq9mVDWtV0itQuEveDssUalgMO3OqIpMqBA024JmU3/abycD4bgAWGbZfDxtHJljh2meJcb9
	bScHVatfEUKoYd4pmJvzDVmpZkIHK3QfmkD+H8gvBJ57/d3CgqN69sJy/B4M=
X-Received: by 2002:a05:6a20:cc8e:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3b5e3423497mr2785534637.46.1781175313262;
        Thu, 11 Jun 2026 03:55:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc8e:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3b5e3423497mr2785490637.46.1781175312705;
        Thu, 11 Jun 2026 03:55:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865861242bsm1588153a12.18.2026.06.11.03.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:55:12 -0700 (PDT)
Date: Thu, 11 Jun 2026 16:25:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <20260611105506.llvya5tda4xsd2lo@hu-mojha-hyd.qualcomm.com>
References: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
 <aiqF5mh1PvWpH3L5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiqF5mh1PvWpH3L5@linaro.org>
X-Proofpoint-ORIG-GUID: wwTly4EKcC8liad6HkmpDZfi_gXAyMYj
X-Proofpoint-GUID: wwTly4EKcC8liad6HkmpDZfi_gXAyMYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwOSBTYWx0ZWRfX+mGSJmCq45qg
 JAR8C2w8KMDdKAoN8Z6Flyv/f0ZC5sefseUPKJHjDdLvnO4yfgz1kTxJck5qh1QyVWNFmuZTSqC
 FREkA2jqBQUp0+nrLTe4+SEjw57AkwNNQZ25kkj8JNf/knwFVlm07MPHl9lDKPppd288cKF3QY7
 FNfdF4DZOi4BXDa9pwxCk66bGf5GLhe/BC95B/8WN6xQlM3bpqw940y4c8glhIGOt413ycYwnFh
 x7Slm2j3cQfKz09q3LK/34j8Lu0ai0g2NiHcBBZQRkWX+8OB7q0iIMJMyr1qKbPFfFKL1+mDujV
 YZE09s7mz7sITKSD3hx3C+600AoDJyz/9U/c5wCtN2sJafCNq+WRPO4rYJHKhigBjFMHAJZI0fl
 49GDRRzXmD0IA20GaiNakK9hgfOt7k6V4sPKyLsbr4CLCbEwGqFnlvDNYzDvwVNyXxqHWoXy2tS
 jOtFAVwuL8VyOemkaiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwOSBTYWx0ZWRfXzRpq37fDucID
 tBHkjXKLS453pLS1V6G1U/Z0etjnXRZvVvDDhkZ6Q/1GUYef1EilvtI3os7yhjTy9aRmdDycmOp
 exM/HW9AwRBxVHm6wOgvGR0vK89fBhE=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a9412 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=84n_F309gJwyGcasrqEA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_035515_730962_C7D8013F 
X-CRM114-Status: GOOD (  32.07  )
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

On Thu, Jun 11, 2026 at 11:54:46AM +0200, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 03:18:51PM +0530, Mukesh Ojha wrote:
> > On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> > > On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > > > If a subdevice fails to stop, it indicates broken communication with the
> > > > DSP. Continuing to stop further subdevices against an unresponsive
> > > > remote processor could close rpmsg devices that could remove the memory
> > > > mapping from HLOS and in case if remote processor touches those memory
> > > > can result in SMMU fault.
> > > > 
> > > > Change rproc_stop_subdevices() to return int and abort on the first
> > > > failing subdev. Propagate the error through rproc_stop() and
> > > > __rproc_detach() so callers are aware the teardown did not complete
> > > > cleanly.
> > > > 
> > > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > 
> > > But what would callers do about this? If you abort the teardown sequence
> > > half-way through you now have an inconsistent half-stopped state that
> > > neither a new call to stop() nor a new call to start() could recover
> > > from. That doesn't sound much better than the SMMU fault. Or am I
> > > missing something here?
> > 
> > SMMU fault result in device crash while other is non-functional remote
> > processor. From Linux side, we do not know the state of remote processor
> > when the timeout happens..cleaning the subdevices can result in the
> > debug data being lost for hung remote processor.
> > 
> 
> Ok, but how do we go from here? Do we expect that the system would have
> some userspace monitoring daemon that would collect the debug data and
> then reboot the device to make the remoteproc work again?

I would expect the manually collected crash dump in this state to find
out the exact reason for remoteproc being stuck instead of ignoring it
and claiming a graceful shutdown.

Whatever we do here, the remote may be dysfunctional without a reboot,
but cleaning the rpmsg device will clean all the required debug data, or
at least if possible, tell the rpmsg driver with the rproc state that
shutdown was tried but was not graceful.

> 
> With these changes, I don't see how you would start the remoteproc again
> without fully rebooting the board. Calling start()/stop() on the
> subdevices again would lead to crashes because some of them are in
> started state and some of them are in stopped state and we don't even
> know which one is in which state.
> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha

