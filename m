Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DB5C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2S3NyHe7JKxNxgaSFpKvPq/rKGPVUbh4HkCUkp0pt4=; b=VXXaPcB3U0HBFcF8jHeHORRnvH
	BnRm+SIZzo9d8mNsWAoKoGWPr6o47Shn6rPgEsKDthr6AdvIycNyRqgSi8CRG0Bu26C+X1pfdR+gd
	iTTYibBcjTbSsq5O7u5+tSZ4J94pYYbfijFoOwHvLbRcUxX/R19Mna55dcUAYLVxCaLGjyxchxR8e
	X9XwwvXKKk20opMlWFUXqZOIAU7xQNah0UzUww3IqYcaHu+u8R/tzEMS6yLUSQCNI9ZGgR4pH41vC
	Cjel1gSrQbUCb5Fdr2UVLZ1Qa4r+VSJ0fufycuxrkexS1XMliiKi5dTkIhznbJ5vTEpveHs3FLQrL
	/ThZHpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTbB-0000000BSHK-2lTj;
	Wed, 22 Jul 2026 09:50:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTb9-0000000BSGd-42zy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:50:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xaMx269708
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d2S3NyHe7JKxNxgaSFpKvPq/
	rKGPVUbh4HkCUkp0pt4=; b=T+yPaN4xCigNC5oa/en9SmTdTOMoSifsGS8W2UkB
	S9UcGQ4BfvtI1dqU4J1vYhxtYjmkXBon6Wh8WsvDM6L8iiljaN41GLL9HJDejAUc
	QyphX2mpDQ2VAkhaTMUy3+JKTmWhb/RuIu6sPTuPX+30bFm8iL/ae5jztVsNsFHa
	Km9E+BDObU9X9c+Micf3Gc94VPX6hNALZToMRBhL4drApev1Osf64XVrTJQRezLt
	D0hBBjtQo3F0f2wZDL1zSGFSWXTsXU72Ghnr+b/46fzpJlbJcvO3xHn4cGCh2zPA
	tKE4idNRgv5yFu0tuwOvbB+XQo6M4bSppba9LGW9PDqYtg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6abcrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:50:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so125401935ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784713842; x=1785318642; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d2S3NyHe7JKxNxgaSFpKvPq/rKGPVUbh4HkCUkp0pt4=;
        b=Af5M2IWUYpRdSmuhshSOKXhMsOOCLdgljuLd+tNaOAkz9fpE9BqcEujEXZsePB7F/a
         8Hzcb10ohs3jb2mWrS8JyvLJx0x4Ec+iOxwZldjssdVcZO/wjcYEfUuXGB9YghcF5Pez
         f3e0LinrACB8Lmd8Ln6kUiDdhN44Ceawrt40UoHeinBQiKB9H+/wzx32R3vOIaWSwTkX
         cmFe19vaDZ+7aoXF6s8cSXE85apju0Hjxg6ea6jNQx7H15QjzQGflHX525LxouAhpkEt
         XUF6Obmp3IH8Wa6xuZrLRvIAH0TV047IbaZ4FgH7aueyvOd8EZ9T1dwzLp4tbTxuGv1k
         7kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784713842; x=1785318642;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2S3NyHe7JKxNxgaSFpKvPq/rKGPVUbh4HkCUkp0pt4=;
        b=Bi4Ljm6JUCu/JK9ib/2hjaQGpuIWbg6BLdB6Nsvwe8OFfODWCb9QaVsWpRcndmxx/M
         QvS0a530DltttlqQTP7ShE2LYQwS7KGVDOqv/QudHs6M8RdRd91AFQ+J9MNlYcL6uXFp
         f8MmkqrcWsXvzjwEPzykMIjWfeA00VwYTis+MBDZaxbUMaYuSIIAih55htRg0sAjA/CH
         yhG/l372Yu5zwfiO16w1kvel1ROX82aI0i4RitfiX/H0Wr/y19tSghS73DkJKfP9ap7d
         xamhe3euwV6IjgCRlOCn4No0JMRA+6QXTqopPZhWb19YMurrhtsOyHZetuX8bEz58H2d
         +DaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr03EE/CnPoAm9FJh9KOnaSHuYNlBGHcBqOaUvWCZ3WEqr/F78zpUjg/sbViLYM4MlsM1F5zrMn59RoBvlO+DZO@lists.infradead.org
X-Gm-Message-State: AOJu0YwHGDVvajGVoK+hqsOkBRrV+ER0kx/Ob9fkkHDzRGrEdjWQ8BBt
	XqVj+tl3Jl3cP/VZPCr5Qdh77+W/FxlqyxZ+Jylbj3VGWv03T1w45tiR2dS3FwmxIAbK/uOPmNt
	S/bt0POGFJ1NNq/boghmSNxEoJwHw34pGmP3oxmKg/eeIALbrLRxT+7wI8XFsmB/vJ07e3ShTxl
	/0Xw==
X-Gm-Gg: AR+sD11iDvje/fxYp9H2ejqTUxwjkI7Oqbcf9vHPaaiSRWhUTianAQ7dLBt2osG0yKV
	pusYS5hbdBABaH0Oc9K3jCKN8T1pQBIFUh/yz6opC6cdpkLYJ+dzZjJ29UcSw6JpKq8LUL+AktX
	3XIECaxVmy2xmopUlf1zyexG/H1spdT/SJ/x87Av9kgNDwtfhbYVzuVkaU0If5x2ulohEK/mFWL
	WUsB6ccJZUszyU4/1Vl8B6cR56bPrbDzFMej3lUMxi3k0q2V/lKVgb4A1nRFCUKbMrGsRq4SINm
	biykozn2WIYJ2tOx2f/G2tYW0eworfeNNGcNLb03INY1hf7IAOcfa+J0EYV2OXYqx3pfufMnmFQ
	Nq8E/pA7+mQE4FBEwRcoJiEK63CDcKIIosg==
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr232470675ad.32.1784713841748;
        Wed, 22 Jul 2026 02:50:41 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr232470145ad.32.1784713841271;
        Wed, 22 Jul 2026 02:50:41 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc8b0cdsm7758862eec.11.2026.07.22.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:50:40 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:20:28 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
Message-ID: <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5MyBTYWx0ZWRfX14UO9y6ht0wE
 TpQAZKDAJ8eZWkTQlwrbU+nFhA+xPhl4vnMLhEyK04hbD+BFHAxFGj1Q2XTQ3S+uivt1Y4AzVwF
 x+eOR6Iv9g6lhGMMDJY0L/MbrnxDOGNRz9vzc4najdxbkbfzJ3JA8zA2zpD/zIFBa0fOgZE3B7H
 7qEowYs+EyxINJgTC6AshNcACnfFBLTeiiRKO12WQMeIqeDbDkD+rddqZM/j9JIUtWkp4rBwcbx
 UUKeBkR66HG52yJurADhf0nnSNeMmcPB5NnEY8A8lcNkEsF3rfsyT24Tbz+y4TpBPEkajDVECuh
 gJF4rs/yyH6xzjgEoZB+fQ+WXpY6RfcFcW7+6j+bJgUxD2MCIFP3ezQ62Qa+hr6m2Qw+K3K3gcC
 BGbqTlw3kEe0eTnOHmQFiQP0ab9YiTMwri19NqLhj2mpujGSmt3yrl/xJ8qmr87+Y5bZvRA14aO
 35QptNK5D36PIPg/W/Q==
X-Proofpoint-GUID: s30ngzsi0oSFK-63YwTGdX6OpuMa1ue3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5MyBTYWx0ZWRfX4BHJZB80VN/3
 WhtodjjR1Wdk2O4Temn6+ajgm+RJwTIJQODS/YsmCuWHJ0ehoNHG+0WtuiOwmOnla2fNL7mpVxc
 /GD/yGVFTkgLQcsO3ohLJS0+gWc2AYg=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a609272 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2zDJ_gd8kjYVRJQFbS0A:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: s30ngzsi0oSFK-63YwTGdX6OpuMa1ue3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_025044_122270_5384376B 
X-CRM114-Status: GOOD (  23.58  )
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

On Tue, Jul 14, 2026 at 10:46:30PM +0530, Shivendra Pratap wrote:
> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
> cookie as arguments. This cannot be implemented via the reboot-mode
> framework, which supports a single 32-bit argument as magic value.
> 
> Extend the reboot-mode framework to support up to three 32-bit arguments
> as magic, per reboot-mode.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
>  drivers/power/reset/qcom-pon.c           |  8 ++++---
>  drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
>  drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
>  include/linux/reboot-mode.h              |  4 +++-
>  5 files changed, 46 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
> index d260715fccf6..ac69b5f39fb4 100644
> --- a/drivers/power/reset/nvmem-reboot-mode.c
> +++ b/drivers/power/reset/nvmem-reboot-mode.c
> @@ -17,14 +17,16 @@ struct nvmem_reboot_mode {
>  	struct nvmem_cell *cell;
>  };
>  
> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u32 *magic, int count)
>  {
>  	struct nvmem_reboot_mode *nvmem_rbm;
>  	size_t buf_len;
>  	void *buf;
>  	int ret;
>  
> +	if (count != 1)
> +		return -EINVAL;
> +

The count can be different per mode. Because `struct mode_info` has
`count` member. This single `count` check across all modes may not be
useful.

Either drivers need to use count passed to them or drivers needs to
receive `struct mode_info` in the callabck.

Thanks,
Pavan

