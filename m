Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095DAD0BB43
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tVOhdag10+zdto7khR1Tar4uRj8y/h1MvaU2T8DnuQ=; b=O3RPP6uJWh6VEvEZfi2s1mKBSQ
	0H2awdbiW8m+cnstVX3djlH8XFdsratTy6YYtj/5yl/BpgNaNOYZ75cw64qdvP2LubX7kossd9fdA
	qupLrI/ktna0l+ueC1rmc4tFLNUbCFb/oec2gmFYx6eTqzzlvI0BCBbkgRzHp5VSbQ18LCc/KjWLO
	2dsmoNLnDdQdi7omomkPHEhPr1oeRuvLFDBEaA4KDgE+jR7UYNdHputI3brkreANAFnWQYAin0X4E
	HGt8AoWQw9FvhLZ4X57LlhudT7RB1ddbE/+vHtoD3ZNCHZ5UKFPX+uJw14tzY41oTij1Iot29eKFM
	5kZCR+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3juW-0000000G6Pk-0HzB;
	Wed, 23 Oct 2024 22:33:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jet-0000000G4TH-38Aw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:16:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9p4Wt027446;
	Wed, 23 Oct 2024 22:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6tVOhdag10+zdto7khR1Tar4
	uRj8y/h1MvaU2T8DnuQ=; b=kdtS3g4PVRvQqa45IxeqL1K8c19uG7h4qSyPocdF
	zYHDhqLH1RYzZdufUQT9BZKiGsekheF/p/hBgP6gFJwPsi0Ld9jNoxyATPhFpxIB
	ixAF4NeCpC20ftLJ8jH0ULdtbsKT7OYHCxemBmCzkHbNuS1fTmuzwsneXVZXDu2F
	sFwoUNExw21cZB17syFIfVr3jkqa6iDzvSg3AmaGT5DCDYpMp60+PKlC6O1R6M9p
	vcrQ4G5N701pxAZMtEOYmbacL4lTeP1CYFIv/3CFWCBFHz0WDh8mM24rjQ7jnQ1z
	OtkCCCckMVK271lUhA5lHrU3NhxyQPZ9AKnsT0CdPCfLaQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wkk45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 22:16:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NMGdUZ003400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 22:16:39 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Oct 2024 15:16:38 -0700
Date: Wed, 23 Oct 2024 15:16:38 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Stephen Boyd <swboyd@chromium.org>
CC: Andy Yan <andy.yan@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Lorenzo Pieralisi
	<lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Olof Johansson
	<olof@lixom.net>,
        Rob Herring <robh@kernel.org>, Sebastian Reichel
	<sre@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon
	<will@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Shivendra Pratap <quic_spratap@quicinc.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v6 3/5] firmware: psci: Read and use vendor reset types
Message-ID: <20241023151556009-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com>
 <20241018-arm-psci-system_reset2-vendor-reboots-v6-3-50cbe88b0a24@quicinc.com>
 <CAE-0n515sUkmTWptgY8pOaMDBPfDp5pZBy9Nby+4cMdMAnAZfA@mail.gmail.com>
 <20241023092251529-0700.eberman@hu-eberman-lv.qualcomm.com>
 <CAE-0n50s1gUt7jOWLEjDzi7ABVRLmAr1kG-6V6YjTZnPD2EMQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAE-0n50s1gUt7jOWLEjDzi7ABVRLmAr1kG-6V6YjTZnPD2EMQw@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jXbGRyJQK_qVccSCirzdUkNaGANmPeIF
X-Proofpoint-ORIG-GUID: jXbGRyJQK_qVccSCirzdUkNaGANmPeIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_151651_930578_B1BF6A5B 
X-CRM114-Status: GOOD (  26.06  )
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

On Wed, Oct 23, 2024 at 12:02:19PM -0700, Stephen Boyd wrote:
> Quoting Elliot Berman (2024-10-23 09:30:21)
> > On Fri, Oct 18, 2024 at 10:42:46PM -0700, Stephen Boyd wrote:
> > > Quoting Elliot Berman (2024-10-18 12:39:48)
> > > > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > > > index 2328ca58bba6..60bc285622ce 100644
> > > > --- a/drivers/firmware/psci/psci.c
> > > > +++ b/drivers/firmware/psci/psci.c
> > > > @@ -305,9 +315,29 @@ static int get_set_conduit_method(const struct device_node *np)
> > > >         return 0;
> > > >  }
> > > >
> > > > +static void psci_vendor_sys_reset2(unsigned long action, void *data)
> > > > +{
> > > > +       const char *cmd = data;
> > > > +       unsigned long ret;
> > > > +       size_t i;
> > > > +
> > > > +       for (i = 0; i < num_psci_reset_params; i++) {
> > > > +               if (!strcmp(psci_reset_params[i].mode, cmd)) {
> > > > +                       ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> > > > +                                            psci_reset_params[i].reset_type,
> > > > +                                            psci_reset_params[i].cookie, 0);
> > > > +                       pr_err("failed to perform reset \"%s\": %ld\n",
> > > > +                               cmd, (long)ret);
> > >
> > > Do this intentionally return? Should it be some other function that's
> > > __noreturn instead and a while (1) if the firmware returns back to the
> > > kernel?
> > >
> >
> > Yes, I think it's best to make sure we fall back to the architectural
> > reset (whether it's the SYSTEM_RESET or architectural SYSTEM_RESET2)
> > since device would reboot then.
> 
> Ok. Please add a comment in the code so we know that it's intentional.
> 
> >
> > > > +               }
> > > > +       }
> > > > +}
> > > > +
> > > >  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> > > >                           void *data)
> > > >  {
> > > > +       if (data && num_psci_reset_params)
> > > > +               psci_vendor_sys_reset2(action, data);
> > > > +
> 
> I'd add a comment here as well indicating that a fallback is used.
> 

Ack.

Thanks for the feedback!

- Elliot


