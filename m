Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A0BC88E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=; b=p3KvZxjVM1y3N0+GRKIZCwlH1Z
	DVtRsPaiJAlrrmmG48w0ZUjB88cubeV/Z8kQ6gJmrZVjYav8/vQcN0DHhBOlI8tWwb5wDW1/8BEaD
	BaEGvDaPqR2h+XhPfTG4dlrVfzqCXG3qPOr1R3a0i74nWLWOKh7rR6gC5IVixUr8Ug880hyptdEi1
	BDcimhSTgrB9u6p53JhB/UpqX1nOM8WLAqpcvbwX1y/6wmskvWuTWqkB35pG97u+j64/md8Sk+8ZL
	0d4icHScT+HfCh/qioHpcxXgPFs9aGc3JHrNApaZrbPINdKD9IYD1HiBU7/PaZNRNLO+Jkboxnv5m
	QSoCSySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yIs-0000000GLW7-4AOL;
	Fri, 11 Sep 2026 10:16:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yIo-0000000GLVW-3Y7T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:16:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kpvg2311435
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=; b=PrR4J3e8x+OtDO1O
	JurWKSGR7mZQMxGkxFWrpX+utMAc1QQmmECC+J99ANcXMVPnpxGQqXEVk78ieeLF
	bxhyraqi/484Ui80ebM9twYlZamO5izrF5AYuLp8+KAX2jecaajL9u6H6H1eISCO
	v932yIZLlL4JlVLgDLqgzvpPfw5EYDItlo0FNKWU5r2eqec0HiKlQpI3O2nnncM4
	qUwBxfMZZSDWthrnGgMgYc7K7xaWcBsBZURlATzRDj2dBWIwJc4LWfERpaQg/V15
	C/4QPszSa9Vrx6kK/UPefSCK/uJR5vDyst8JwV86MsQvZBGuljEO4GqtcEY9DMmf
	GGck6w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchx89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:16:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so14218515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789121773; cv=none;
        d=google.com; s=arc-20260327;
        b=aT0LLgdNgtYm2ncn78/Bj4UQXQdhdOYFByS+e+DluZplRtp4HNyg78o5+R7j1clDIl
         8IB3QZHg6QOgrzQwE/G282H/QV0ndX85a8eU01cOu805jcmJh9YjmmHUHHZaN2kzVdi8
         kYO1l1AHM5O418oZezNvjQs4ezqr5MgGx91uBKcb4VQHTeUa8cbgs+wuYBF4UoJB9Fdi
         PHRyjSS1AqRcVmBC4v5yvGVbpXeNuVIv7PmZr5SIUYVCWTEr8I2oEQdS0vS30PogPVn6
         p7/dqLl+PjjcNKE8M2yvn3yGqaLWaP/Ih0lWVDS1dS5PpbvtdkJtZKq01Lwq1Mk/c300
         7eQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=;
        fh=5t40ZtiTWA4btZpMQnfhDiFrl38TOrA7q26cmTlc5hQ=;
        b=de7nXVOWXgfBNq9fGBC58qqfizt2TX89GiYps7cPopynIbfqglUG8sdxpuc1tGH6tC
         c16fy6DG5jiVXOZ91IkXfHXyWsSnmLQvw2J+8xh4Yz9I3jsc9kmii24wpaHHuwYQkoC3
         WqVzNjRMiiPaiNKEven/W8mig6wKLb4sANtOKtwvdrN1I1wA2XgNoFRgdOId5KrYn0EG
         EwdYpgtvf1l7kd0P8dkwfYI9vhnKP0CBk/rp7Mcr4zifue/wWK1/RtnowP4nCCG5TnhT
         RHsdWxtgqRS0VCD2rSamlj0wQ/G1IVAMGPsV6cyqC7mP0JqYJ2WB39Pn44EqNz0QN+C4
         xDxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121773; x=1789726573; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=;
        b=c2QAjjf/hVBdOk2NxNH9SHMAJv2X8DhzR4CBpoToiW1iiz1tiRtLI/V8lgIxZ+Kcri
         6M1wbtOc+rGlUOaAclmDVMND9vAcsQVrIXq44WIjNb1bR+FxJtQg7/OiQpzhUyma2gFC
         hnu5wDiZs2suDnBA8PmrLMyNeS1YxrxER6uPNR8Zuf4g3uE8LNnRTsDq+sG12kwo+WTg
         FNuuDHIwf3g8mBL7Qga6s/SyhoCIllZ/pd5bPCJDFxdgjOGnH06k4RfqTPkuwacWxkbU
         dl8LlRw54wD8UnG3KFtHnyw1xA8kqzNOb4mMP8XFgEDGsFGkWElzt35Eu2tdadcrXUNN
         EFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121773; x=1789726573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=;
        b=d5esSXNYt31ySwxzsfm6gzNzYkUiLxAKe5dfet6/EOjC3nV17PnDeA+VDiu+LDpAwc
         69Fs7PC36fVQzALWoa8j7OZpnShLBdUY+J5IXueB/bu0AA3o+6sZgzrMuWaCc7AFZgwH
         FcTbyKCSDkfoZIlw0w3ImzuE0FPfYO11pq6nPJBFLrwdhydGm5OJTvFGtNv2GbaAo4nL
         6SsaB8tu+zpEl2w9oEP5ScfOlniq1pcETbKSA/2Gga1vU51gxfpK0vEDqHnfz8yw3Dju
         rRxagbO5gK1Zz1DOg4U5llhjptuSTxEAJbHd/TGD17izaU1deANA0NWb/VrDojSTtX7o
         xVGA==
X-Forwarded-Encrypted: i=1; AKwUvByEQWqqxVXYJylKWH7Q1IKu4gevywJrGF/KjoRZxeVtH65hfY/9lgym9HGrjfE1ylDan7byuR7j8DlvON6FiPwE@lists.infradead.org
X-Gm-Message-State: AFuF++k6p84XTXwITOj0DzNh7g/Cmx8NnpWyrPKI6QSKX2h5d6FXXAOH
	kpKBXjEKGx+cLTHMALL8dfvMmMm0KGMdUrXiP3ZlOeQEme4LePvLQdhDgU7BkAYAn9VPbSA3zel
	EJIjo6HNdwq6zpBPNTCULfjX5Orztg03clbk7I9CdNkLWrf2M93drAz2WcwQ4/501aP33GpxxZF
	FAsemaNLP8mtFJtbsCvBfEy7tGhNTfjqFhaj+uhMowuLgTYBKemoJ+
X-Gm-Gg: AYBFou2/zbYs9WXxBuVuYxlLkcgKiex/9WfvIEev452llNiWoErwtv34MwPqJ7ZgwFy
	Kgh1AXcMgU5SFhipdYu7Cht41Vs2EhzfKg/lV8qD8yQ/lXk7LxL1G0aJv0sOQl1ELBe3fGjYanZ
	imp6bxvNVYrtGIXiIN9l+zVAe596pmhyffZ50HS+kMQd8A9iNCf9IqMzMj1g==
X-Received: by 2002:a17:902:db03:b0:2db:55d6:349d with SMTP id d9443c01a7336-2dd2a45818amr67010615ad.21.1789121772773;
        Fri, 11 Sep 2026 03:16:12 -0700 (PDT)
X-Received: by 2002:a17:902:db03:b0:2db:55d6:349d with SMTP id
 d9443c01a7336-2dd2a45818amr67010175ad.21.1789121772237; Fri, 11 Sep 2026
 03:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-3-ulf.hansson@oss.qualcomm.com> <02b29827-3ca3-414b-9377-972f3d46eb03@gmail.com>
 <CAPx+jO8Cf_NGJ6h30+cd-arAJGQL=V1HayRZqaTrM-xg9eUhpg@mail.gmail.com>
In-Reply-To: <CAPx+jO8Cf_NGJ6h30+cd-arAJGQL=V1HayRZqaTrM-xg9eUhpg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:16:00 +0200
X-Gm-Features: AcwNN1VXOL5T2wS1gBfHMSChb8upujLEO_jTsEBDjEO09CtMln6UezixLgCoqhc
Message-ID: <CAPx+jO-ZP_09poe0rHm+h4QQZBbHJisCdQGa6kA67sQAkU-BfA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM
 domain to do power on
To: Dhruva G <goledhruva@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3d4ed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=u8BtVuMVLpZXKRMe:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=42KKylR2Cj7GAKIKN3YA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MiBTYWx0ZWRfX7cWKvZdtn/4v
 DQr4ov3oh6MbSjEmgIbS/laF1x/20STzBmews22SPrYucQ6ZkxeYYiB8WDVjg88Ypntdl6+K0MD
 +gR2qUVwQyckJS7IrKN0+Un+Rd7+Jn6m1CNHTzyQKoR+Gnufr8XoBrhM+nMEqbtZdGoo/+Cavqh
 savyDe0DXPqPk4Bur6lJKKyyNMCmREbSI/jUiJaBvjsxfemAcP5ScjLzlDDfLN6tcNkiTjcRA3+
 zG9Rv79OLhHgnTxtl91r1UyPB4Dn6pUfH4JYuRLifvxv6jkrlHZWY9Ic7jYkkkW1HHedu7YwOby
 vCQ17LLt0d1MhKafRrB7GmcDhdIdwh4RKjDtdJChqzFFFxB0CK2KBKPATwWuhsjE5Z1ZbwLHLK/
 c22i3MSRSJ7Nqg2N1g3dj1mr/B9+9AY1FLCuyj1xomu8oj4oFIVwZDRG7Xi7UKUguGSjRqJn+SG
 eh7JlNm8R12q19zw+7Q==
X-Proofpoint-GUID: PbDUzA3jJgXPOPKhAczzSBvCdTfxWWzG
X-Proofpoint-ORIG-GUID: PbDUzA3jJgXPOPKhAczzSBvCdTfxWWzG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MiBTYWx0ZWRfXy1Pm+pZwAtXf
 /l6cGlvwEhZimKOhhHCdjnPY+exIiJ2IDB2lcQTZ/faSjy6SgXzO4IvdKr0gyNBhgxFpp3vFnBj
 Bbkw3BA+qVFgccmz1gS1dRuO4jbCaX0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_031616_744392_1C355329 
X-CRM114-Status: GOOD (  42.12  )
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

On Fri, Sep 11, 2026 at 11:06=E2=80=AFAM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Thu, Sep 10, 2026 at 8:31=E2=80=AFPM Dhruva G <goledhruva@gmail.com> w=
rote:
> >
> > On 07-09-2026 16:46, Ulf Hansson wrote:
> > > A driver for a non-CPU device that is attached to a CPU PM domain (th=
e
> > > genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently =
not
> > > able to power on the PM domain. More precisely, to power on a CPU PM =
domain
> > > one of its corresponding CPUs needs to be woken up if they are idle.
> > >
> > > The current support for a non-CPU device is that its driver can only
> > > prevent an already powered on CPU PM domain from being powered off. T=
his
> > > leads to problems for a driver while probing its device or when it ne=
eds to
> > > call pm_runtime_get_sync() to turn on the power for it. From the driv=
er
> > > point of view it looks like it all works fine, but when accessing the
> > > device it may end up with various errors as the device may not be ful=
ly
> > > powered on.
> > >
> > > To fix the behavior for these types of devices, let's adjust the beha=
viour
> > > in genpd_power_on() to wake up an idle CPU that belongs to it, in cas=
es
> > > when it's needed.
> > >
> > > Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNr=
sZVYO=3D38R2cLV8nw@mail.gmail.com/
> > > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > > ---
> > >
> > > Changes in v3:
> > >       - Moved to atomic polling, pointed out by Dhruva.
> >
> > Thanks, but even in v3 we still have potential issues.
> > It does not fully address the consequences of polling for five seconds =
in that context,
> > nor the parent-lock nesting issue.
>
> Well, I assume we will not be polling for 5s, as it would be an error
> and it means that we fail to wake up the CPU. But, I get your point,
> 5s is really an unnecessary long timeout.
>
> Ideally the timeout should map towards the deepest domain idle state's
> entry+exit-latency-us, but rather than looking at what is actually
> available for the PM domain(s) in question, I think it's easier (and
> good enough) if we just pick a common value. Usually these values are
> in the range of a couple milliseconds and in some cases up to
> ~15-20ms. I suggest we decrease the timeout to 300ms and see how that
> plays out.
>
> Also note that, at this point I don't know of any use cases similar to
> what you describe, where the device in question is in an irqsafe child
> domain. Hence the polling would not be done in an atomic context at
> all, so we should be safe. Anyway, if this doesn't work we would
> simply have to limit the support to non irqsafe child domains.
>
> In regards to the parent-lock nesting issue. I don't think it's a
> problem as genpd_wakeup_cpu() is not being called recursively, but let
> me double check this to be sure.

Confirmed, I could not trigger any lockdep problems with my tests.

If you are fine with the above suggestion for the timeout, I am
thinking of amending the patch when applying to avoid posting a new
version of the series. Please let me know.

[...]

Kind regards
Uffe

