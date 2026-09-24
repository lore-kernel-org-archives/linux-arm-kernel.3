Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCDAC98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7o4sXqMEUD4tozolejNSM52fQJ7Y6v3Lm6hqHPo0dic=; b=OebZq9uv5MoqXDvGtNxM3wDtm1
	Tts6LyJ3jUi/eAcKY5459VX10DvzUOB7sCa6XAY1EHhoioOqNpCESd3BOoSX1K05jt4ngtNJtHdyl
	dcFGy3OFluZRzwZDoLu0eHkVSghhdUsT1nNcpRPS9iLZOcLA0eb4B1PVI6C3BicRnzv6h/ebZfVQp
	UsaAMAh2Y+pNxT8YRcjblEPP4NNjigyfY8WFUArKiS/I//ycsw+ObAtaTjjX0jnFhc7VRv9zsExTj
	0v5Qk9yr9LBlfkWUlr3kjoSRveCAUJrSSWFRkvI3FUECpoU+J0h9nZcb+KSRJ4/W9S2GMCDcANHBE
	JHgfIsww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9grz-0000000AlBd-2dBX;
	Thu, 24 Sep 2026 10:40:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9grw-0000000AlAu-3iVB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:40:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3YO5538624
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7o4sXqMEUD4tozolejNSM52fQJ7Y6v3Lm6hqHPo0dic=; b=Y0XfV+Kec5xWXhkk
	DaUZP5E8GRnVIGZQiZ+Kxi3av16QfNUGxpIcCRBbpU4qC273GQUEHplgzStWb4Lc
	ujrVJRZZbNafUvk1uPuJWWXee+i2CbcW4hAsWG7Ou3Cwjsiz7fVI/8YRlohnqBZa
	17n3sB5QPO3xFK3vRnNT9lFURJBQfCrc4RjPabLQZxR3X+1AiSK7xGYj2Obt+TnT
	yWUW7oRBNWkVvrOJMZ4ydfpAKXDih5G+wqJTXddF4JyWD8TPduuZ60TIn658bbCS
	lBCuc32EJu31A3L4hjPcmfj9ZBooxfYVSt/cBhdAaT4XwwW5jd/a4tDQQW7PDaml
	8ZvUhA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc84at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:39:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so2060788a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 03:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790246399; cv=none;
        d=google.com; s=arc-20260327;
        b=Usv+G4r/d0QOf+//WKc3ylZggVP37nXOTw9gr3B6/SyCQ5kOW3HIFDHw73w+gwMCws
         VVLE/F+ipYWzkW8LnWMCBCOs81y3qO+dJJ7QJzyibamCqqt2ki+kIzWSEA7F10uwsaI8
         sd1HjMTsYUYiEfxCOHr3d519QQO0XhJTp0BCqy16fTwMYjIRnacrL32/uFMk6v9RDxBE
         6T9sHcXtWDuvTZEnSYsTjMOHjyzu1wV1nPZvYI+A0vj/2q6ACoe6TQkiv2fZ0rmFFoO0
         yFIpX/Ff76whMFkvbibrkSL2r9tqK/UVSOFPH8VA/dog8K4lDOAlq3jB1dCVibzaQWhO
         iWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7o4sXqMEUD4tozolejNSM52fQJ7Y6v3Lm6hqHPo0dic=;
        fh=3ovS/ghx3L35vSKbM5cLPRPVDOUwRZiVlSq4JeulmR4=;
        b=HUv2UFq667B/WCXgf7ZWgpM+t8rewMkxyLktVLPTHZXqX0+d3sQsA33k5x7ny+21B/
         /HjdZ15yDdB9PxM11GIQa+aZ4zTRQOQQma+q4v+/aaZL3e38rILXktPha5B40ZsPHTiu
         7jPWtSQd8baDInAdp9A3Ac9Q67H9Mbu8CHhKpL4b31Gp6K1C3oGs1dB4pOkYEDP7vYiK
         qWoa9+uy4sDBbZNll1/88QtEQJtDzHhMOmtEcNARh1ttQOV+enjieOi6L++SX7+IhJwC
         GNqM2KJBj5F1t/kgR8kE7wEMlfK4sm7f8UxIf+BVviDnTv2SExtZQcnU4jbeMVy/r4x9
         O2Tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246399; x=1790851199; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7o4sXqMEUD4tozolejNSM52fQJ7Y6v3Lm6hqHPo0dic=;
        b=YRuoDVjrdizgKGa9zAbBSbc4JQSfqfmdn7h1GRsJPCgE32wU4m0TatvSgXcMk5KMLA
         R+183MlJFPpdXwFAhLNHFEvRtspOy1kQjhb0/89A5h3tQIK20F2Nxw52wBJRz4HoH78N
         5dk1vR0URsdXrWQPN/WD47dVPbm+KCMlN1OAd45R43mYTLCbad399LpZCvtNaC0/1TeP
         GLfx16aALN+lxGMLyUGlagnvwudysSO5+nJWqJ+hmaE4xGyentK98l6Emwv1rssoQi6p
         CF0GkGhtzgmV5TxPje80M3A0pa0hhzizxHdLg0h/MoTNOueLwyt/Ol/u9FrUKv+RZfdz
         kkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246399; x=1790851199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7o4sXqMEUD4tozolejNSM52fQJ7Y6v3Lm6hqHPo0dic=;
        b=S7EUUIguNNs6WpM7v7FM26nbJCnSfdaUWJtxcRLYU3fz0cszxpt1dBIXgs5x4fQPlR
         72ARfUsQmn4wRTjwtkOVTT0/g7xbRfRK2Hs664e2MWp8U6KYOxZSueKoFs+kHyjRqy9k
         kLp/xhzR4OPra0eCQGTNM0+/9RHZ23R/bzpfBnjCDfOpVwL3OEofzGF6l/x1sBjRptlm
         1EFxylp4r1FH7qM59PGn2JPicojIubiPoD2hkz9b/TONDs00wDZWgR6AXqMQDX0dmIJa
         9cALf6A5rYfOwQmA3e8eteAuxSFVnBG4iSUM2GRlmR3Kx8DOFQhv8I8OJHHGwCNPRMql
         c2Gg==
X-Forwarded-Encrypted: i=1; AKwUvBx45UmxaU3a45ZWGj9K4eFy1YbsXNIcZ7dw4Q+47W9bLc5oXYDBSX7u1raYeIQxu9yDoE05UZ7p2b7Au75izis5@lists.infradead.org
X-Gm-Message-State: AFuF++lbrn/3l+QyYOu20Z1WRHWlPCSTNT+ueVhwzMK4MwuRhGSODya8
	sGId/+w9ijqTadkAXbYvaevdWywxOyhJoDOhEJkKRWGIGQ+jYZg0oAE8jw+4Z5hULJOcfrqOswI
	mXbGG9my+rMSO/QL3TbEB36/kkPwUFimAoxoh0GlXZ2MpuWIHdBOLbgynk8fmmJeVTCIaONlzbw
	YVe+kYGhj4UjawT+uTtio9LKZRkcdloMByZpHy0PCAA8gfBqiC4kEMaFjf6uO5vt0=
X-Gm-Gg: AYBFou3nEFWJ/p9BuaHYYi19QR4/GGNFHb6yfh1qlmRt7k0SWwWHEdv6pn16VVMQl05
	1H4rOe7P7y4vWOU6CvKA8P17GDnnWyJGQJul7wVL/Y4fpGWrg62lmmbaX6XIZXbUhTYNz8P//Uk
	AYiV0xt0FnFQBuH08Iej23QO2DHNP9fzrQUG/LxlbTcDWgkYDgYXfCjvMgwA==
X-Received: by 2002:a17:90b:5288:b0:39e:6c68:1553 with SMTP id 98e67ed59e1d1-3a09896c4f8mr1845420a91.27.1790246398864;
        Thu, 24 Sep 2026 03:39:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5288:b0:39e:6c68:1553 with SMTP id
 98e67ed59e1d1-3a09896c4f8mr1845401a91.27.1790246398385; Thu, 24 Sep 2026
 03:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com> <20260923084921.3942100-2-zhangfei.gao@oss.qualcomm.com>
 <828e6cff-79d2-4349-805f-cca927f7b908@lunn.ch>
In-Reply-To: <828e6cff-79d2-4349-805f-cca927f7b908@lunn.ch>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 18:39:47 +0800
X-Gm-Features: AclHuK_oSplCB1cNSh3eb4xbYdUh-XZKkPLtPpesSmH8opQdf4f0pOgS5eCsp-s
Message-ID: <CAFkd8htx-MTOMFO1S3uZt_8wyL+qoOhb577O2MMYr6oJ9jc=vg@mail.gmail.com>
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
X-Proofpoint-GUID: EVELQVBZ01TK9KYgk6AHRAh_9WzWQRpU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5OeAA4PZ5K0E
 uj6ItTNZW+E2nKtnXef5uki5ib1FpqNNf3qbDt30x7sjMe3Lob1YysKQzf7ULEXRWbCdnDGq6Jv
 GvXlRhqZxbXHmBQYZQGz9gyISanM2Mnmm1qgwRPeNl7/4iK0EQD4GkJB+4NY0ryvgcbMuLfveWJ
 0ClVlo2D0jLXQYb57jY8Tts3svkXChrL5bKo+NWHplL1CN+2jg64DmizWaU6b6/oppebMo4XI41
 uBfUCyGopXlgMlPU+61rosduxT/R7kjI/DcmCPNfx5YC1TKy4jbKPxX3JVtHLu7EvYWO5IvaWaI
 A8rxhUTQW8veHChn4JArfrxMRfsW4O2Sxs8v1BLvVuZo9C7NC4CldaZ0XC0MvT3KI7yrbEDJPX+
 GKmMAcE2gurJW00PZgIS39WJwfYuzj76xbiCuZ4ZS5L0jfL3mA+lmTw2HWOQKbol4gK+JCWxkda
 fuLnKlc1MRtOCDxXS8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX809bINgYSlKT
 TmKlQnc9FcHkbSPL1XyPUpYN+LIxyqUhGuldwJwzhBLOEPY7s83stUbsPr1LApUqP1EyR+ofvnQ
 rtXfeI/IdzTFWp1NiwzgR2qX5BjkTOo=
X-Proofpoint-ORIG-GUID: EVELQVBZ01TK9KYgk6AHRAh_9WzWQRpU
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab4fdff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=grw64qVw4vexnSpzSHAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_034000_932387_45E038C0 
X-CRM114-Status: GOOD (  17.11  )
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

Hi, Andrew

On Wed, Sep 23, 2026 at 8:58=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> > index 091c9b57388fa..58ca296fc4420 100644
> > --- a/drivers/net/pcs/pcs-xpcs.c
> > +++ b/drivers/net/pcs/pcs-xpcs.c
> > @@ -23,6 +23,12 @@ static const int xpcs_usxgmii_features[] =3D {
> >       ETHTOOL_LINK_MODE_Pause_BIT,
> >       ETHTOOL_LINK_MODE_Asym_Pause_BIT,
> >       ETHTOOL_LINK_MODE_Autoneg_BIT,
> > +     ETHTOOL_LINK_MODE_10baseT_Full_BIT,
> > +     ETHTOOL_LINK_MODE_100baseT_Full_BIT,
> > +     ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
> > +     ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
> > +     ETHTOOL_LINK_MODE_5000baseT_Full_BIT,
> > +     ETHTOOL_LINK_MODE_10000baseT_Full_BIT,
>
> What does T in 10000baseT mean?
>
> >       ETHTOOL_LINK_MODE_1000baseKX_Full_BIT,
> >       ETHTOOL_LINK_MODE_10000baseKX4_Full_BIT,
> >       ETHTOOL_LINK_MODE_10000baseKR_Full_BIT,
>
> Compare and contract with KX.

 T denotes twisted-pair copper media, whereas KX/KR denote backplane
  Ethernet modes. USXGMII is the host-side interface between the MAC/PCS
  and the external PHY; it is not itself a media type.

  The BASE-T modes are needed here because the attached PHY reports its
  line-side capabilities as BASE-T modes, which must pass XPCS
  validation.

  How about using a separate feature table for Clause 37 USXGMII, while
  leaving the existing table unchanged?

  +static const int xpcs_c37_usxgmii_features[] =3D {
  +     ETHTOOL_LINK_MODE_Pause_BIT,
  +     ETHTOOL_LINK_MODE_Asym_Pause_BIT,
  +     ETHTOOL_LINK_MODE_Autoneg_BIT,
  +     ETHTOOL_LINK_MODE_10baseT_Full_BIT,
  +     ETHTOOL_LINK_MODE_100baseT_Full_BIT,
  +     ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
  +     ETHTOOL_LINK_MODE_2500baseT_Full_BIT,
  +     ETHTOOL_LINK_MODE_5000baseT_Full_BIT,
  +     ETHTOOL_LINK_MODE_10000baseT_Full_BIT,
  +     __ETHTOOL_LINK_MODE_MASK_NBITS,
  +};

  -     .supported =3D xpcs_usxgmii_features,
  +     .supported =3D xpcs_c37_usxgmii_features,

  This keeps the capabilities of existing Clause 73 users unchanged.

Thanks

