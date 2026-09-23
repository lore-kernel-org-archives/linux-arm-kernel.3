Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37693C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=; b=pRrWo7Q1vDZZ5s1XfvDoSyYJXW
	DBSdHFNhO1qt8/HKZDRv4EwV1DKUbDDVg6n335xLSJOWAcvG3B1NAsQPh+0VbsZuZhFl4e6f4f6Zg
	TCH0XbYPDLsVH2lkl5ggKv0JzrTShyRxqN5de0hYF0gJHFe6Vza18yiOYv1ZnN1cv4a5TQSZTi2gT
	oEtvWQo27IUw5H10TBrTUPQr+94QraupL0BqDxIs9lG1ZZK2+zuZFo1C0FhJvzT4xuYRZjJ2JhIqm
	Kbgs9USOlY5ynbRaqyvjOz6vG5p0FFF/vKAMazRsUqFzGDYXQC9v6lqU+E6+xAmmrHqyYgXvBL1HD
	+F4w7Vyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lsy-00000008Df1-1bJl;
	Wed, 23 Sep 2026 12:15:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lsw-00000008De3-3HKd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 12:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=; b=U6XG7h5+qGsYjTJgY4DX7oCdVD
	6mbK21R5g/Nwy8rrNe+Olt0JNAhQP/BCeGOhlBfRTXuQlMQG1htXzdGx6Z/SXJHRczPeCqOD6AL8O
	xIdrwoNQin+TThn7a7gHfrXXVXvWo48VDkYfg3c7p/WcfJc+6iSjRcOJ4X0n6FS8di2IhH6bITyC9
	altZHD0WiWyn4Z5Oblleta/tJkEfxmmVeoY+CkEglwyd1eL37upvK1CGc84uYfFBhs70yC71O7Veq
	6qzqNdglhwyooK8+5O6/Pha4o4lC3QsKXGvbsF+ZtE729TiqULExdoJ64WhTQWczK7do+rtpb2rvN
	kE+NKjMQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Lss-0000000EkAW-0Dmu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:15:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbVmO3616406
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=; b=WKz+l+81SIY+I4oS
	44zECxavKPfTQl2Ns1Sv4L2Pn0/8Um+wFPtB/28MmwIY6yj2odPRvm/KTXW/ek/D
	I6GetvLF6GlwfekM0XS2dvgEy272WAZfO3MXK3ijOSBQw3UxZz5tzmgw815dDdu6
	uptlzcNi4faF0Jn1s7rX68LpQPyYpSPXh2o3PmQtyQfzEYn4P8mtcbZFjfgMSnF0
	P/082aJeYcp84krLOma+xfMW3d/ozdR8bnL6qqFL/5SxQelHa4rf17v0x0VDAeLt
	nmdLdzn2yHYmtmAdVSBWF7qa1spMbHxYrbQu5H5VZ/GbFlN9laX0jZQSoo1BJtdp
	5KIgUw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8649r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:15:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df5a65671eso9348655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165729; cv=none;
        d=google.com; s=arc-20260327;
        b=qjF397W7/tQpL2eV4PeTYuVdIqQyzmddNvnkyRawzZvTu2ToxcH18fE45sKTt7R/NS
         3RfkZ+0JHTXiKChnyizdNlgLHgsrdJ2kUSyMdTwF5HVUPdnOw3nv7gEfBfYoAOWwhvci
         m+TMRdkl41x7jrmTQL5ITmkDZCyXxZc71+V2WpiVMym1m6SbLsoU7N4aCTEzH+EAUfXy
         8t/mghLKg8Mah35qkXqzAaaouE7DlXHrExYdVl4TFlNHEYzSIawfFnYq4vi3FPVR6OVl
         Eh26hX/TBQH1AS1uXIp7S3HXSEjuZxR+BYfFDSWAhoHEHvrhcA10E2ivO+2CGvZJq6RU
         wMhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=;
        fh=tORFCxOeCVA6MF56mRjaDV0j6vRx72qacFWKmX02cPE=;
        b=BFc+wCM84+vkTNIdJ8ixkC6bCn+KhhTuykStYegqbYW0ad63rNRrPq+LosG9LptP+4
         znCh07yxZRbGOraTGr948uW8zaHhodIwrQ1AB1f3LdbyhS6jKw0WvC8JSVUJiHo5Ee9Z
         9MMta3CQLfbITKCVo6a2aerBufROP+jNHFXEn2zdxsYRsdaJFR19WrXcrgrvF0Cq+N8z
         VzVpBTaQ2gIF7/Oj3h/iFjaAl6OlfNkvlwtoS2vexEnNZ4ldGC8cTaTjQx1mgzYb8qMq
         ByTX2xSKAeAQhEAa8gKcoT/R5X5K5Qt71KIOyBUaC3s5walZDwU7PPfaiXzqQ3GD8YfP
         EkaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165729; x=1790770529; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=;
        b=J0ORbswtx+HJj17Tmv8/uHoYbnI8MdCP1ew/8EJiWVhbraa2mfwFzhcg2uRmP8rYWj
         +KLKFKJG0cx3AboP9jaN2JUtoDjIXKmsiSpqIkYjAoOvEcBaIT6AI0dz5YQvSxBgmvVB
         43VUr1JClO8JT9CuiqU2Btm/l96BcqYGX8YkM7fg1+NKOS+g2dlBFtatrowT4LksG+la
         DBk16ZCZ7nOkuCakZNmRbrIT0g0uFEW9JVJfbkkh49FyYKJS6x6L5LIduQwMPQGiR3Dg
         oV5sdnImR+19bneiMUm4G1TmBvVpppSA2ypeGCeonYYRKm/CznnDg3PVmhtxi+zfD/8I
         u6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165729; x=1790770529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwqrr5YcknBVVx+rZGdCo6L8R95M6EOo6myZTngecug=;
        b=xqR1kCI9OfQ7HFmHnbKzMNaextn+rZUYiYmzrLYrO53byvGH7bGwdUnCBVV/Kt1q84
         EG8ngx99TxP531NvZCDwdJ5Of+HQhFTMm44UuCRenV0RQBFoKh66RpvZh2QatEan3bxV
         +tsM4OkI1QTNKaHHbs6Ol8tI19JuhHTmB7uMHofunH2qS1F3QBTHsnJCGwTSplvlkTVn
         lXE42DDOrEv9UO0Eg9k7TfDJNFG2amBplcnFZ5HcdrxPb9caPUkUdjA2NU0ETTSjMGr0
         QttuTwisDhcoWsajEuc7cmq6QDgcdWS+TxwNke2VQbKZziY+6D4xVbV+hNQ6IlGU9Kb9
         i7xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK89vO25PFvj3b6VbIfnz94WoTw9oDQQGT5PfVWbDrCaOaSrWM/CPTx5UKScyIwCRk+Eh3EdTAuQZQafv5D2tm@lists.infradead.org
X-Gm-Message-State: AFuF++mMVKTPWHpDP+tJ9ga6firTjxQtEW2eUpykbW11y0SHS1JNnYtG
	SMGsl6Ne/5hiYarLraKqO/oeLmibke0GwbyPaNMkCdKFGNwGcHJHpRaEwzAERnDQnsrG6obfo0D
	UXI7uaULk2htMu+PhOM7kaqDfGnSmzP7pKgBOtsC3RV3GL4nH4Jl5p13EPGJJ3pCBiejWED/zYX
	qhGGhh5dBxUTHm1VFQzu9yj5Tuicjj8CWaFqU8GAXMpVDRbKmbM8jG
X-Gm-Gg: AYBFou0ivIY8YxaNzG71Aau64VoeiYQ0Ey7Gw5P/S8gBTQA3jFji727PuwoNf/e3Pvw
	WB4z2DtZL1UKJlv0v6KcdKJHCySakWumAnwOlG6kJHj47bFPx3GgCVMg4KUbpV3FSofLodu9XpI
	YaqqmrBsNKMErh2+JNAkQZmJ3CM8mnB6murk97VGhlt009hF0dsy3bJ01izndvvGFxA+ye
X-Received: by 2002:a17:902:fc44:b0:2d7:5da6:2af4 with SMTP id d9443c01a7336-2df609dab94mr31311565ad.4.1790165723860;
        Wed, 23 Sep 2026 05:15:23 -0700 (PDT)
X-Received: by 2002:a17:902:fc44:b0:2d7:5da6:2af4 with SMTP id
 d9443c01a7336-2df609dab94mr31311365ad.4.1790165723390; Wed, 23 Sep 2026
 05:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260921033708.14433-1-phucduc.bui@gmail.com>
In-Reply-To: <20260921033708.14433-1-phucduc.bui@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:15:11 +0200
X-Gm-Features: AcwNN1VsaeqV92H7KEZC7boQTZb58RsMU14eBT7KgfgQJPOV9CTm7Q_Kcg0tGjo
Message-ID: <CAPx+jO_RAw54HMsgCSaxghtgakJ0rANSY-WY35SE1i766mMsvw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: imx: Use pm_runtime_resume_and_get()
To: phucduc.bui@gmail.com
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, rafael.j.wysocki@intel.com,
        Jacky Bai <ping.bai@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, Xu Yang <xu.yang_2@nxp.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ming Qian <ming.qian@oss.nxp.com>, u.kleine-koenig@baylibre.com,
        Marco Felsch <m.felsch@pengutronix.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Guoniu Zhou <guoniu.zhou@oss.nxp.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: s9WvNbcS31Z9kefAN2kvT3jdwGB-0UzU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX1rHORfDsx+wr
 oWmeauB2+0cYfNVDusjQseuHHD4OomTbHBhpKkUNWdXrt6m7ffNUfTa8kFOw9ro7m2UUE+Lgdsm
 43jK6bpKq2tT3J8Jjnl3LFzn14YzP5E=
X-Proofpoint-ORIG-GUID: s9WvNbcS31Z9kefAN2kvT3jdwGB-0UzU
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3c2e1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=B7rF2LB79GkdTgAebh8A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXyDVlwPYJLjhv
 hUqslZIOkzEvk+AvQO4bHISiYKQ9koxrMs1K/ovlzAEdsQ684lx/8EVXKBknWxFdsLod7jcGS9J
 p80vVPApak/LyF78L5r3V/xwQGzp6xTnrtTnX2Fi0Hlx385lNu1UXG3plvOSavK/TPOcwWMYc8J
 yqbn5XjE2oE2f215cZBk/l5lcobjLTyC9SjqDBBS3srI3hb8tdLDCHBEhJQaQcz6KSUwVhyML3h
 VgiTgAhwdYQ5QPKfe0H/0/nthjxRo4SmGKewek03cvnXsFdhBinIAJVJpSbvmA+LfPE6EWJgT74
 7/yZBrPIf95FiEj1sNrvrD1i4sVvj/Th+hRHG8y33BbzfrzC2ZXbDgr+3HUMbiLuMtEQ1ealBJi
 bX0rP18TV+YXXyqzSa8RHiMsTBH/wpV6SU1jKZUBGkwzteZAHJAqSMbqXGy7MiLW588c1JJInJ+
 uyvLM2BbUQMGrMSjWJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_131535_013845_7C1D691D 
X-CRM114-Status: GOOD (  16.93  )
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

On Mon, Sep 21, 2026 at 5:37=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Hi all,
>
> This series replaces open-coded pm_runtime_get_sync() and
> pm_runtime_put_noidle() error handling with
> pm_runtime_resume_and_get() in the i.MX power domain drivers.
>
> No functional change.
>
> Found by manual code inspection.
>
> Best regards,
> Phuc
>
> bui duc phuc (3):
>   pmdomain: imx: gpcv2: Use pm_runtime_resume_and_get()
>   pmdomain: imx8m-blk-ctrl: Use pm_runtime_resume_and_get()
>   pmdomain: imx93-blk-ctrl: Use pm_runtime_resume_and_get()
>
>  drivers/pmdomain/imx/gpcv2.c          | 16 +++-------------
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 15 +++++----------
>  drivers/pmdomain/imx/imx93-blk-ctrl.c |  3 +--
>  3 files changed, 9 insertions(+), 25 deletions(-)
>
> --
> 2.43.0
>

The series applied for next, thanks!

Kind regards
Uffe

