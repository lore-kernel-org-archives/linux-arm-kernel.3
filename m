Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA51ACA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=; b=jFiEMhSXczjwnLcV+d+09sBPFA
	zsd8MpBtTDBm8y2N1HWtfcVihlWXW+AtWKhH4awoBIEzZ1p81yfO8cMoM3nHHHZelDtufZUuRAtAr
	BuOx2zZkFjKMxr++rlia5K+7uuyWoRZHkIQ42d+L5Ls6yk4Uvv94XDLFCFltE5goGoh/+D7l8sER1
	gUlTOTMaN98xguM8aFra5akrZn7bKk7tuQPb7COPR2vuUaTgzJutQC/shR7Q4tF+Bs7VbBIgnN4MR
	u+ntMxPm/6TMXW/xJVtcTn4rCOkO2FDW8NiVoW+AmE3KnV1eWBDdENL1oxoXBSpgRKkrIr6GR6j6+
	NLEns9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBjs-00000006Sw6-15T1;
	Fri, 09 Oct 2026 14:38:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBjp-00000006Svm-2aAA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 14:38:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Dkn711639633
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 14:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=; b=VbYUQwuJPCbtoeVX
	m7otJFYOvB2nJ/0eD5rMovP6i9TEsL9EsY+aAjWGwu4BLzi+Cow5JCrCB0CpVwpc
	KCqXEBJThkepkP4ptknCDiKzHIua9stKQaMJCjZ2OedHblO1CwJtlYJe5tyV9rpu
	zuH+iDR3Gu/xBamKr5oMgVhPrcqdRvt9a6NZNcjuUgHnC/Nzg262hRdLYGi+Lh06
	YBh4CgVsDbBkT7VgKX38+3M/mXE1SkgvkmZY007Urf4ET0KiRlXMmeMGuIl3ut8G
	4IeuA77qbU7JY5aafiRsZCu/gCck2jBsIXIWm8E1ufCYrq96pI5kCmefSMsxzfrZ
	bOVO0Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h71f1r79g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 14:38:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so9319649a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 07:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791556698; cv=none;
        d=google.com; s=arc-20260327;
        b=A2G0jzG5DGK9qJFrCYV03YGSBD8z/i+UpXpDfMmHQl8rxaWYD0CUfJLIZzwuja7vUG
         BwRvzthiKRD+jEHfskhUY2Q1d02sUi6PxVH2Xy0c0rLK8O4Cd6+zrcTYRGGrEdDl8KLN
         2crxLbQN/yYhQFHUvyiplRhOXAw7CKwZeg/k/x3CmaZda1UYAEDH+10A/WXt9/J/guLt
         dh/XEhMSkJOKh1OEz1VOnm1ZQq4OKiRW/URPrcIw/rv5bIfe0T01orwYvcLK5mhYEDp/
         sfwfmAgXwdXGJmPwTq4Ha0AbJHCrc4sQK72uT+X5V7e4ig3bJt3PNlDmwgG3zGWcIlkl
         oogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=;
        fh=3kfE9ecZN+z6G0VxIPQIxCtobRRfF7zCXSI0zKtvOxM=;
        b=nSfTEdAFQfAXEkWnM1l6+ishOaF4zRnMtqpQs/Q15Y+EPAhurQYPnGUGbkpXTcqYlV
         cn0KCb/SXEL0lbOFzEHaVS7dF7poPsziDANGGi2F7meC3I2sjSa+flsSROboAzIwTMB/
         p87VXjQ4IHzuyFgZjwMAqyTpPmtE91oezXbz7P/B+J+OFmf/JGq+snmlRnnIyNwMo3Ps
         gAb83UyEepl3A5ZIyxUZdNrhJNE7bTNjTUoG2SbLMrEiluFLysdqAcH27mQ8sLdYXGnT
         HtTUAyzQEv2BXL2TjKdpqCtU7fIZWnsKcxe78mJMunwC3VueKJ7pZxqkETfZtuJul+A0
         kcew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556698; x=1792161498; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=;
        b=KAH8sKqA4Ad1rc9un9yHZmkfDP9iO2RTl2cAvO5aRdMgQSgplY4mXp1NhL8koTWp2N
         luZekson3An005OAy+M7DZdyGGJ3bIDqI89YkuiC474V/kFWPj+SDjPNUOFymMhtTCqW
         w/GuU74Tm3qZRnx2Gr5GjAwQpHnGFKKNPK/LaNB1BlwgqHI1bdfbnpSLATHOO/QiAzoJ
         zD0fvNYIvVS9T7U+NW8XcIobDPd51djKuofdOQGc1qh0OV8Aj8i7jCqz/ofAsnSmAM6U
         253fDyLMwzUJ9xpQCgx/InjP1eNx1DZb+O3f512inp+nnlQnSqlyUgVaECpFyhq5gyHJ
         Q4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556698; x=1792161498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMVpMFCHtMG0Xn67lqGB8w67sz48UmLUXf0QKHiAu9Y=;
        b=BmyxF5Lh8kAovPPCjyH4rKhuwx0MugapGZZtexdvmU+XApKKtBQ/W7Q1PlbI1OcZCK
         r/iQ8n067tYJDXv3SAdn+sx4Yv7C/zCH1k5pUd63cOkNZtA118D7UEuhPssj4VxiKE8b
         WLg9QwCA7j0AaRlm9woHCdcU35l8S+Ob5XY8oYNFzjf3RmQw+iZ7rGL4/je9WLnmUha3
         LgwMVL1pXg1CCEFqxfwLlVP/WsXph7SohWFwAaTHTtWPSo7UoJITYSOza1nUUownZhC8
         5m7oyZzow9g3EbCmXc4Mv1mxE9mOhunRk/W0EuhYeFg6HYck0DLisURxNHleS+9KO+vS
         dObA==
X-Forwarded-Encrypted: i=1; AKwUvBxCF+CXFxW9EalTfYCpW1xYnbtqszzPQHSvqGCEDwZhHcXW3c2jZ2YwJ0nPZIKlBlzGkcxJdoRdx5UbLvMCeYov@lists.infradead.org
X-Gm-Message-State: AFq9FYKqTBYYbvnUZerJJviXrPII40dPt0OWV2htv/1ZhwjAlTaMCUCu
	p1xEbg1KW8snYGINWO7c+Wkg9IwTRQ4P8/Y3zZY/M+SJZNg8ZERAAARYuf1mYwOGBWtwoMj9x7n
	97vGwvOcjXohHXvqyKJWL6EzQaCgCEIOsKQ4fLgdIzEthMCZHyxLK7kZ4M2+KyO0+E3mJTbSt/C
	6IfldkT4Zm8VUrTJya+6aj1Ur74n/zwLEglpB7932irhLCWO/CCQ1Q
X-Gm-Gg: AYBFou2wDf8IvhOBSbp2mUJhxvEVNAcu/Gw+2hQSC/lm54WKfPEDBu92rcj8H2a1Kon
	QY6X6LHlXyvTVogstj5sCfuMO0OL6a1mWrQCH5qSNfATOk+gzMmSXq14DzItvb5wZA8lxeo9DvS
	egv8tEF2tGwStP5O046+PqcY6BK25PIP4NZuOMPaM0t5HS5yrakqxG0OWrNw==
X-Received: by 2002:a17:90b:1e41:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ab3a96ffd7mr2186015a91.59.1791556698420;
        Fri, 09 Oct 2026 07:38:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1e41:b0:3a8:9b79:e6ea with SMTP id
 98e67ed59e1d1-3ab3a96ffd7mr2185985a91.59.1791556697914; Fri, 09 Oct 2026
 07:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org>
 <20260921-ux500-power-domains-v7-1-v3-5-9352be6b86b1@kernel.org>
 <CAL_Jsq+1O+os8=YGUoKg6zCm-r0gQ35baKX=z65uTQNB0i=RVQ@mail.gmail.com>
 <CAD++jLm+yRo9e1UDhnaYrdPq28mdyYKQZ6tdKuUa3UG85imkNA@mail.gmail.com> <20261009131902.GA1195061-robh@kernel.org>
In-Reply-To: <20261009131902.GA1195061-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:38:06 +0200
X-Gm-Features: AclHuK-dvh3nBN-NbcFTG0ZbDjXuEqk09evXIZaWdeTMn5nwqDOFCebwqJJJ9Ag
Message-ID: <CAPx+jO9F6wUG9M_cV-xiF-KAKD5kJ02n+yE6L9vocs=KWaKFTw@mail.gmail.com>
Subject: Re: [PATCH v3 05/18] dt-bindings: display: ste,mcde: Allow power domains
To: Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: tLaF72hVj8f_BEDPF2zOa9zQRKAwZ16_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfXz+MWj1S+5S5G
 z5+v0/TH9giV3R6fl9mIgTLu/qyznV9gqLeeKnoUnA9q2mUs6zZB7OHlAYAjvuWI2hySnfY02gE
 WTiqrybZoTYspaGha9i34MTP/km8rJk=
X-Proofpoint-ORIG-GUID: tLaF72hVj8f_BEDPF2zOa9zQRKAwZ16_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1OCBTYWx0ZWRfX9RfSi0cD9xfQ
 405r01ICeYu7VnNoNEZpTHPLlfdq3ln8vnjdZT2mJRimT6i3G13ll+dcrd1VN5lTi115XceZtfl
 mrt50z2QdUollI0v1cFEWMtxvkNxmtM8U89xY+4JpzoQHZKRKGWl49vBbl06AcenK3dEP+myViL
 6CwWsIhqCUbhGmJUDZXPKMWTLRtLJxWWhnsrz5ujivtykB4G8z9ZFHt3qQNfP038+sOctisj8GR
 O+EsIWZmlNJ70JDbqvq9ijEbH1Ak/zsCDbGCwsrSRxvT11r8DWAz/5r1kRzTWimm53l3+b+ZN49
 X/E7N8FyexWwaNLWhE/SC9vGwbr1eW7CdF6/j5c4kaD8MRCUj/oWyq2kOSPSGNEhimKErXPImHV
 xavDh9qOGjyKR8cCIRoQA87wr06Mxx59dRtFXQp6vy+tKV9L3gnNx/mthO+lJkjjI1Lev/LGbpo
 8tmRVo2VhEcqd6z0Z0A==
X-Authority-Analysis: v=2.4 cv=YIUKWhGx c=1 sm=1 tr=0 ts=6ac8fc5c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=sRttis5sQqJQ8Uet4gEA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_073821_796709_D3CFAF9E 
X-CRM114-Status: GOOD (  22.97  )
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

On Fri, Oct 9, 2026 at 3:19=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 09, 2026 at 07:05:46AM +0200, Linus Walleij wrote:
> > On Thu, Oct 8, 2026 at 7:41=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > > > +      power-domains =3D <&pm_domains DOMAIN_B2R2_MCDE>;
> > >
> > > This patch is in next, but the define is not breaking dt_binding_chec=
k.
> >
> > I screwed up, I forgot the dependency on the new define :(
> >
> > I asked Ulf to merge the prerequisite which would resolve it:
> > https://lore.kernel.org/linux-pm/CAD++jL=3DgFt9kKZH9T-m8B_pbwRvzc35tTrM=
n5V238d3528DpUg@mail.gmail.com/
> >
> > Is it very urgent so I should just revert it? I could also just merge
> > the single patch adding the defines into the drm-misc tree if
> > Ulf is OK with that.
>
> 'make dt_binding_check' errors out. That kills my bot for anything based
> on next which is most patches.
>
> You could also just remove the define from the example.
>
> (Note that drm folks require a revert be posted and acked or they will
> revert your revert. I learned the hard way.)
>
> Rob

I have queued up three patches [1] for next from Linus via my pmdomain
tree. The patches are also available for you to pull via my immutable
dt branch. I assume that should resolve this problem?

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20261009-ux500-power-domains-v7-3-rc1-redux-v1-=
0-5eb1b90bc35e@kernel.org/

