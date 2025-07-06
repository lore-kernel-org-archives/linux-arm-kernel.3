Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE2AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNLqJKBidzQzs9Q3iB6rllX0zuzSzHASza6JjvzvcsU=; b=rfxth7CASVlAUMCahrFan3SCaX
	OS4KCtCrICvlINRcnvDWd3y3pmic/E5OWaXP2gmHZ+13pbfvuDDYuGvkgd95Vjglc6kmEYk87bzcN
	WAiOz6q7DTSQvN8MpINkYqWQB0vonftoCN8BAOc01IGFr0pujpRYf50lQE7iMpLDq1wuE7Qrx8j3w
	aMZRU5eMCLW0Vyh3D6ll4elnruWZ1Jjp7ViP6/aVASpz+VP2x2BQbjLke6VgiBxk+AdjU0kei5Dhf
	ftZZ6DpUZ3CVGtNLrpfybB2wwey02eNHx/0zvUF7tDzIh9Csw9Wtm1CN0XI/XBd3wbPQHqgBWSCBk
	l5jliH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYSQP-00000000Wio-1GTQ;
	Sun, 06 Jul 2025 16:41:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYSO3-00000000Wb6-0hhT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 16:38:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5668wnZa019164
	for <linux-arm-kernel@lists.infradead.org>; Sun, 6 Jul 2025 16:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PNLqJKBidzQzs9Q3iB6rllX0zuzSzHASza6JjvzvcsU=; b=f2y7YQ7wST77nR9Y
	0dmZbqLsSojWomiKoPXDQm2Tx9yMe08UhqI1/UIC2HPcGjHQoDxMDEhbvYI2qvln
	9MKieWjP3cZzzEr2miqgvXN6xRrTwirjyMZeYKNZ1svvNUid0/VDysoNAYKHYiLv
	1JuJq9oxD+aFwelx/57fc7xkyZSg0CtIUe0kr9B65Rh663Mnbw9P4gaM0cWjvDzW
	naAhqyGUAVML1nVGziN8aLrHKbriiMH5Wu6pi7PddR6ocYpEWlvUrjCoeGIWSwXm
	Qx9Zw074VG+jgyYOh6/J+M4mGV5TdxZnhsOfFmP+1aRAaUy/ud/aGmd9k+fd/3Hy
	M4aMOw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q52sx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 16:38:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313d346dc8dso3323698a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 09:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751819921; x=1752424721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNLqJKBidzQzs9Q3iB6rllX0zuzSzHASza6JjvzvcsU=;
        b=fATuiTYwLK4bl+gkkQn1Dy5LjI+4fkR7sVhYiCmsiiw8uTdJsHaIFJkbcbYIR2pFT4
         2mC+SMN4X6AR4KegvxYsqUo2mtJLY9WFAboCx8DjUs2yy2AraEWcVZaLWrRiJQTad8e9
         vD34nGVuqC8A8LsnGteYfjbGkQ/hmWmyZHFpWdDwtzP3MyWDvb4eD97fc5oMnGxy4isa
         RJ4jLR/629R6wGugyhC2dX6g4KKThl3nUtg3UKog4GE5nqlId+q4YMC1BARCYs7urrW7
         MANns2NfoM2vmxvri6Aebe7vKn0tWinjk1zrlTNXmI/90HDHlDCi0kcshorPJJjUboEj
         txWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW615rUayth0oYMBtvCSv2enlTdg/N0LSxMQvNQ49OnH+hiTeIF2INCsCy4ofVjMdCUQgzBkDJNMAjXIbfqX3cw@lists.infradead.org
X-Gm-Message-State: AOJu0YxmjVZe4q++SJfCoLyI0BAG5bQxvlwl/W6940M1uesl4loM6gSB
	8W+U59MUM8FtXYyBJqrGtAhg9ZZ7gRgBh4+SFxjR1nz8BBei1lpnWd1nf+Zd2ta1DwCAtFsiXHZ
	4vndbN8YItDo4lTiR+APx/pnUegTOsHhChX3U7OslHwAGAxSB+d8Pnv+MSyujmVPYwzt5KC+eGu
	QVGvYm65bWmEfj1r9rxjYgJuMXaGukoaAjUiibFhJo/OECD0dnk+IhIF99zapsXmk=
X-Gm-Gg: ASbGncuOt2riF9yMzTZyOI1eil2Z1jYaJTF1WiqyWR1zhyNuNkkRBVPTXoIhMfoN0OI
	LkYwB9RoLuk/Yd6ko9inn/U2ePBq1tfWQBr5sNTBPPZqyf6OPcnOQkXu4OTb4y9AyphojIIfW/U
	ses94XUZs8opabVEA+YQ==
X-Received: by 2002:a17:90b:3a48:b0:315:7ddc:4c2a with SMTP id 98e67ed59e1d1-31aba84339cmr11006873a91.12.1751819920692;
        Sun, 06 Jul 2025 09:38:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcKhJtg3uXFrqq3g0A/eUGQshjmCzCt96AqXzmSmxuXG5dupDH/wUPqNaPHIQ1Cdxc4V32m2fmkfrBgi4TMS4=
X-Received: by 2002:a17:90b:3a48:b0:315:7ddc:4c2a with SMTP id
 98e67ed59e1d1-31aba84339cmr11006847a91.12.1751819920320; Sun, 06 Jul 2025
 09:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
 <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com> <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
In-Reply-To: <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 19:38:29 +0300
X-Gm-Features: Ac12FXzV1gqekfRsne3MkAr_DHFG5FtNyFV-IwP8Z86RpeoBmSFTV-zGCH7MKto
Message-ID: <CAO9ioeX0ffO8-v-mZaefFbyjOcCqGyu++gFjaMkpHPMyVOwE_Q@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDEwNiBTYWx0ZWRfX9V0fvdtha8T3
 dIEbAE+R6w4m8tbrcrN+5n5Ly2nzGkQE6F+G/nUKHnOvqiZKITHn2jZLWh758/b/jSomjHw0KYl
 L9+NcUh8w2/fnAp1fwm+Z06r/Wj0yz9WyrSIR04dpY7CEpGXyGqglrvfgqCVkotUY+hL4qL0aUu
 orItwpfRsXZ6o93r/qrGmbw+K9+FxrvEWPq0804slj4ry+b63tj+Q5aC3R4UHlAndRQGJrl0Bca
 oUGVGIzyreZuNOnvWApss2eN5WaoP2RV91cebRco+Uf4xWX2aL1J8jzZntee+2wIaVjW/KtnFW3
 HkSHzlXpjHf4D42IEUwFDyRhr8NNBz9ADxZ6fxUX8iCi5VR4CSWXaRLS1s2JswztZ2WIiHnYuND
 4okZw47jbLCW3Nw8p+Ud8lB7/x2mhv/42j6GJucX9ALFk+/1sLk7RN7La97wXU8qhXIiflBe
X-Proofpoint-GUID: TH660BtybQg7wdsHA9_hu4drILij-IRj
X-Proofpoint-ORIG-GUID: TH660BtybQg7wdsHA9_hu4drILij-IRj
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686aa691 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=K0SaaKOuJfFG6UXcetgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=520 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_093843_283163_DF7F127A 
X-CRM114-Status: GOOD (  20.54  )
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

On Sun, 6 Jul 2025 at 18:20, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> On Sun, Jul 6, 2025 at 7:22=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualco=
mm.com> wrote:
> >
> > On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> > > On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> > > because of the hyp limitations. Disable PRR support on that platform.
> > >
> > > Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >
> > Unfortunately, there is no way to detect firmware support for PRR safel=
y
> > from KMD.
>
> I still am a bit curious about whether it is the ACLTR write that
> trips the fw out (doubtful, since we write other bits in that reg
> AFAICT) or the PRR_CFG_LADDR/UADDR write that does it.

Indeed, write to ACTLR seems to go through, writes (or reads) to
PRR_CFG_[LU]ADDR cause a reset.

> In the latter
> case we could potentially use a reserved-region for the PRR page,
> instead of dynamically allocating it (if we knew what values are in
> LADDR/UADDR.. I guess 0x0?) to avoid reduced vk functionality on these
> devices.  AFAIU the vk extensions that depend on PRR are required for
> vkd3d.


--=20
With best wishes
Dmitry

