Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99B2C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k1V1OZLd8PuPRGQwN97+EBOj831I6h3gVcxIujOMO+c=; b=prkppmLSz79mvdbkuQjG1hzWIg
	64XmtyHdUguIFqxRUIvI9YXxltBe64aAz/940vL81dAFk/P5pDSZUGBgvPBSEDWFwURXWj181PV+m
	tpZ8ne+uP5Ln8ALHavXwZR7u2S8aOMDt6a4BzIhEKQ8TrzMYu+DN9V5VAm22hVFmAZIXfvuWzGKnj
	JXev7BObtM+GSbnff19gX1u8FqCF+hiSZj1SoPypOxX1Jsuca7iWrzC/XDDb3WjUKxC/FnZciItVa
	dOccO+L9BuRVFL0qL6ABtRCRO95Nqwj8mMfkoho7nt8wWRxtxP/8P2BaMEfVsMT39BRec6t9ML9gM
	gOzX+b3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hNt-0000000ApS3-2GBy;
	Thu, 24 Sep 2026 11:13:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hNr-0000000ApRB-1bxu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:13:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA5PL81175662
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 11:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1V1OZLd8PuPRGQwN97+EBOj831I6h3gVcxIujOMO+c=; b=FJt9BdBBPANqD09t
	Arva/bOhhI8YKPNoC3dT8lyPPLQWPFtCkEMrTT9P5TbeT9Bd5OfaXtdFdMUNxteW
	OBNxC41ZioyCWD1j+IXkrJIa/ZAWEgqnTqOVpALi32BWAmlMQsEsGsP5W1+iLKZB
	fCiIWq+aIGAqQr64amrtXf7rKBGSkNzVEpgVxNZhobTHWRS85XFFZ3e7o1tQJF91
	HQZuk1CG8tO+YGTx5q78IxkF0TrPzlp2cefhTU7Dlt+Ch5FUGR2choeOKiCqOZGi
	9FkOSKWDC1DgMSM2aJKj4H6PZaehuIs/Aj19TyCnypn+LKDycYNp+WbDMYotaOnD
	V6WyYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7r8d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 11:12:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2435930a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 04:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790248377; cv=none;
        d=google.com; s=arc-20260327;
        b=s9EGkUInbTjaZJ6qfgYfZmtHz3tpeeABoMCf+P/y25sBqISH39lbLcf4k2xscfOJHf
         d1d6UzpZjjsFODDogPKekQugKfdClHVxKZwT503ZOR48AIxsdcNLCKLNwjLf7jUdYox9
         ESPW6zJp6yPFIGXNobwKlIhdlLKsW2VCNUVZ+x8KUJcmQ14k4W3Hms5zS1Ip3ySZEW94
         d/KRDewVxbxZNSYmSvaBQCHasSFQssLfkHlYf+oF7WaOyyVWG36LdzgWHx1B51oAtuXZ
         ch14fu8V/IaM8uw2TzUjNKNJ6oLnY+uJkKA4k3bSL41Srm+s2iZOMzjnQe6b5OQU0uG9
         6L1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k1V1OZLd8PuPRGQwN97+EBOj831I6h3gVcxIujOMO+c=;
        fh=1zpjD5nvQX64gLaLHClTavtA5fjz+MtoOHbmAvu5Dt8=;
        b=Jx9XYqa6hvd+aFWUMXRoDZcR63Hli9z/Sm1uWk4AYiA7stPUKrX6v0yCwN5hp+eNc6
         ChTGhZU1BGcj7DtsH2bbWo+/VVLGa546CSviYDlk3dIdLKLhp4lHA2dK7naO1cxjgN8b
         2JZqxs9zY5JQTti/xTYIfNI8JrYiTU5l2nDWoSUp7JqBUHSoh9QJc9HtA1PZTvDSY/z5
         0jX/TNtyFr4XXIQIQxDKxOBKrJUv17wM0peVMzgGdcEbCSA5QO0mEB2TIEeLampQ6oTZ
         rattyJosuIOBWjK51LhgWUirA/8jhoAlvxkVzNY3Sek+Vwbalw5Th8r0Q7NqjolHxmze
         Cd1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790248377; x=1790853177; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1V1OZLd8PuPRGQwN97+EBOj831I6h3gVcxIujOMO+c=;
        b=hx1kZEEu7Xd+vds/M6wGXFydVM8y6sI9w1vxOGfk/2WQpBXZc3PiSo+4zwgQUjvV1I
         M0Pj5IRLzq/7GrGIqZf20j6nVEZ+6v0tDAXhw0w4d70suofDIJuZmFrEGXcOv8DDu3xT
         hIgCQGXVZ9/XRzJPHexe022SXEwCeWYnO5N+oT9tFMAH9bOqZuLJD07EuSrNzTxSIm/C
         3Hz+W57Gc7d0SGfMzBvjEdBXbGUdybfVhIKVIFUSOHFnKifOfRAHkJKLnl0573sna6Tg
         4kTk46JM8WwcpqZZKUNFg5uEbuxDK55bjRr3M7z8ykxyVDY89rEXmGcL1IgNapbN5i4E
         PcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248377; x=1790853177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1V1OZLd8PuPRGQwN97+EBOj831I6h3gVcxIujOMO+c=;
        b=ZuWxGplTJBNc5IlqBCsW1MfAzrZFaXeA3fyNEKd1VOgDRtV0tLMpMCIZhsfSINk8bM
         IBPa4kX9YN0ch12Rp50k1jKAymG9SshFPa9XkIRPXSgngXMd0Td4GjVmG7n+CcyYcONF
         pghl5CY8UucSmsAbL0E006ZElfIjR3K2ww9/LFRqqC8W2giCnLPy0N5rcwRfwvOs2yne
         wTTwqXbc5s80baU7egxewBQXtuT84HszCFHFS0qkDWst8rOJ/k26ynPylXZ9xeG+POoj
         OyecLfKsC18H+T+8lMev3ZADpIeGEXGJ8YO+CMjFwMTOOc8rJIdEqtTR6b9Vfcgja3Dn
         r06A==
X-Forwarded-Encrypted: i=1; AKwUvBwgXaYx2axp2w/pYSTBCqyjkR8fpISoH6C2eQ4/oBN3FycgD+tHRyZVVWz0YbK8HJX2Z70EnxSKFAxe/Wjimolh@lists.infradead.org
X-Gm-Message-State: AFuF++nQjpLuwdu69HA7cyPl51AtFAxtMsmOOEoJWzAvZCx5hbWn0h3U
	mGsfgJWtC5elmQCXcrsDKMg4Nb6dnvvK/zhzHSm/yj7clJyv6tN19Cz9SvuDcG5e+zU4ZLWtmbu
	SO1WNSZCbuNSkN7c/8sVWBVp8SOqDeRAEP0GpDeUJSMd3fVmltK8fDmFVM6UHncStznGOXciq0a
	JqsBcEW7jskqlP1MsPTJAgN+PfkRSWKugHasgTotUPF0QTVqImKEZE
X-Gm-Gg: AYBFou1ZKNPFdndAFwLuIlG2m9PSaXS9CPU7FHRF6V/xaYuglDhgNLRolotVkPDGQKJ
	F0/rsu6KLctLeeCPQr7QmZ35f37qSkohGz1yZEr0RvDJa31cYYqVrfsQs5118rGmmaBUSpYPCQ2
	NPNyU9TZW3RCelUZ47kTnZZYMIAoSZ0aqe+V2RVGIQpzoDjpl8OnqQFkxE3g==
X-Received: by 2002:a17:90b:4a08:b0:39e:6c6a:6572 with SMTP id 98e67ed59e1d1-3a09896f00dmr1967125a91.53.1790248372023;
        Thu, 24 Sep 2026 04:12:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4a08:b0:39e:6c6a:6572 with SMTP id
 98e67ed59e1d1-3a09896f00dmr1967095a91.53.1790248371549; Thu, 24 Sep 2026
 04:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com> <20260923084921.3942100-2-zhangfei.gao@oss.qualcomm.com>
 <e05baad3-49ec-4db0-ac70-ffd8e0f52b10@lunn.ch>
In-Reply-To: <e05baad3-49ec-4db0-ac70-ffd8e0f52b10@lunn.ch>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 19:12:40 +0800
X-Gm-Features: AclHuK8TGQHMGqvYSLBah1tI2wfOeuTGvUtjSV6O-ttPpvUSi2Ylv2WtiPcL46s
Message-ID: <CAFkd8htkQnq-KVKMc-qTOFvbgi9BRdnewzmyu4c5B2hULDKPdQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] net: stmmac: support low-speed USXGMII validation
To: Andrew Lunn <andrew@lunn.ch>
Cc: shengchao.guo@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, maxime.chevallier@bootlin.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 1AFWMF9Mqc2reCrD2rW3Knslmlp8rtiW
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab505ba cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=oAscVk_Hh32IO0NGH0cA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NiBTYWx0ZWRfX8yE0aLtBKbIG
 dLM2ewvoQufJEZGhflxbNzGPP78f3RTvYllKV2d+4O+G0iwxbdHOiViR+wKvE+dgpGUToPjBngE
 qeXyaxYZ4tSoc23HH6wyn7d+8TPdSgtHmReGVHI4VzE3A3s2JY2KJNYVTW+9nVJCEKFhDnABGHg
 O3z4AQl4dxekAwoDIcKPd4/30WAHmGIZ+igpU7JuhGBJVDHJzsbILBcRILWW01aXCanMx4qPrQb
 dAfKati/7xVuSdDUp7RbnZRl9PtNhPF0Fx/Xpq+dHF/AkqVy3L4ARTEcWRmeuPfAX5qPLFF3wfp
 dUzAa5BJKoV9WLAMXMYEBFAPpa68VO/BTumJa16gS/qyKYBkpLA2U2kWLnE9aRLDltpbb74l2d1
 MICP43Tdo29Lh84yxyH6nv7cdkBSVrNw5RojCuvR78HAefNB0576pE+QaYHWP4HKhBLD5CrHW6A
 g2YPOIehQzlpTYSOkMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NiBTYWx0ZWRfX4gWoNZDvm/Up
 YyitnQ67Wq5OhSBkqSwyWL1qpoGNZqI2DgKe4eYVoCeEYc2duGd+xtpq6wTflUiw4M1eCZ2zOf4
 9MafSrdgloQuYRpjlVm26PgScqeHJi0=
X-Proofpoint-ORIG-GUID: 1AFWMF9Mqc2reCrD2rW3Knslmlp8rtiW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_041259_543268_2FF9A244 
X-CRM114-Status: GOOD (  23.78  )
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

On Wed, Sep 23, 2026 at 9:09=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > The XPCS also consumes the PHY-generated Clause 37 in-band link and
> > speed status, so USXGMII must use in-band signalling.
>
> Is this a qualcomm specific feature, or defined in the databook of the
> licensed IP.

This is defined by the Synopsys DWC XPCS databook, rather than being
  Qualcomm-specific. The Clause 37 USXGMII implementation added by this
  series uses PHY-generated in-band status containing link, speed and
  duplex information.

>
> >       case DW_AN_C37_USXGMII:
> > -             return LINK_INBAND_DISABLE;
> > +             /* The PCS consumes the PHY's CL37 in-band link and speed=
 status. */
> > +             return LINK_INBAND_ENABLE;
>
> I ask, because when i look at this, i immediately think is this a
> behaviour change? Is it going to break existing systems? Or was the
> old code broken?

 DW_AN_C37_USXGMII is newly introduced by this series. This change adds
  a separate case for that new mode and leaves the existing DW_10GBASER
  and DW_2500BASEX cases returning LINK_INBAND_DISABLE. Therefore, it
  does not change the behaviour of any existing XPCS mode or system. It
  also matches the implementation added by this series, which enables
  Clause 37 AN and reads the received USXGMII status in
  xpcs_get_state_c37_usxgmii().

        case DW_10GBASER:
        case DW_2500BASEX:
                return LINK_INBAND_DISABLE;

+       case DW_AN_C37_USXGMII:
+               /* The PCS consumes the PHY's CL37 in-band link and
speed status. */
+               return LINK_INBAND_ENABLE;
+

>
> The commit message is where you try to guess what reviewers are going
> to ask, and answer the question before they ask. Seeing such answers
> in the commit message gives me a good idea you have done your due
> diligence, and the patch is probably O.K. Without such comments, i
> have to assume this is poor quality code and really exam it in detail.

Thanks for the guidance.

Thanks

