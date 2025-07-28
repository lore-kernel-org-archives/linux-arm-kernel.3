Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5868DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOxjWi9b8eIAm2p2pRQ1nK3wCINCr+bSXTxNl04Iwns=; b=V7606lHFD/dNzVhY0YkvqbIc8N
	TFTRQcJJlbPV2OtkyYriHw2EgjG8A2Bp1TEWjKQg1eiusH6m1gV5B1R418hz6zYqfGRS/tc6E37GO
	LuW+n9c9eRnnW5k8SxXYGHzLS4Nh3Qwhr5UTjzdw4ETmIkBVFpwlc9ajbvWXUHjRXaBtl3mE3NKOe
	H5WdS1XUCzOgT21dGKv15hLRs1ocZF+ZR3APrit8diRxsiOsD071MG7CqcYyXcI0LEvaK9qLdVZAk
	E1RhBoQy6Ew2RRNRynSfGMXEEq+TbywUgbs/N+f/dBWb8ymdFJlTonNGL2yqnwDhIB7yZRPfHg2nQ
	aK9ngryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKRh-0000000E9Tt-3PDw;
	Mon, 28 Jul 2025 09:47:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKPC-0000000E8z1-08kT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 09:44:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rcLk017029
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 09:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UOxjWi9b8eIAm2p2pRQ1nK3w
	CINCr+bSXTxNl04Iwns=; b=DVDp0PqBgLD+NF8qmIq9Qt29gBEp5VDIQCAjQkSf
	3npSFDhlHpICA5usCGoY5cfH9tM6JZAJKFp5NIZ+SX40YcKCBJx+RKv/7s0WBHQO
	2wm4egiX4/zdb3BsGuONb9o+82nOU4Y4lu3KDXkUuGRVZpxaNn9Gje7BPIfahr1j
	RS3K7QyhnL7MGGnWSPZs2zKd/XsyQ/lx8JBDYj88GUgwDlDH7wojIPM0aOR6Mgou
	O/LEu0laj17/H+dRJf59W+061sSkUd63Xwicjokp0PDYJ2R0w3V9TUhL73UpjJsD
	ox8/4YeovcrXExrxvfE2fS5nBkhQOwTDcnA3SLM/o4UlOQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860ens8nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 09:44:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fab979413fso84329746d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 02:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695863; x=1754300663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOxjWi9b8eIAm2p2pRQ1nK3wCINCr+bSXTxNl04Iwns=;
        b=KDWQge1uWltZFtrkytYNBC3FtpC9nYTpux+ISomOsPyUzJk1mTZXZDMIDZ7JB18RKg
         syWblcrlEGuOgN8A6NxItmVbfcOtC2Q05lYFWRJE4iuUKz9pdSy49dZQW+Z1jBMy7i+9
         obp1vgzVTCjU2KPv3ruU/cdjiWttvA6sEcO2VMjUn0cRuHURZha97lKXJ87puZv5Nffs
         /KiuuVtu3qBztuNg5VCMUq8OTLuPvgdoIAv6EOvSlfplG979PtKZHRo2IYfhi3NRoDXa
         KBhHYG7An+J8hbj7QaXyLiQt1kQTa3W1miJvJJ/FgwCL3LYbGLB60q+nzTdhT1Lf1jO1
         1q5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWGRyOK9PhFfn6FjqiD30EoYDKobNXX2uo5fr1ug8jgEjZKbni7Nex9yQHiOqYFml5MHKziNhu3eD9T4RRBIeQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyIyNt345HvzAtJ8umb7GLbaf/bdhnV3Bn06WwXeqWmdSS9HyAc
	xOVMDbdfivlajsV5AKh6Jz83L+d5xAIgq1Q8S2QsYtQp/qnOPPr/rtzzeDoXIjb3W3MREmcRqeY
	kPlRxIuGEoYPaSkqE0mNwtNiw6CWjWVjOc3w16EFvSal89IW2aAAWycirZn8VYJZCCJpiH2UfzY
	NAqw==
X-Gm-Gg: ASbGnctv98OgmAC6u45wr7gZ2sckzxl/gdySG3hrRZxwZ8Z6LpkR2CS4LfMUcxySSxc
	NF8n+6+EoqgRfWjsOqTUV1N4nATi1pCM2oTHpYdpGuqbR3ahd6kXNkoHRNgMsYOeGPrpkAgetef
	uTrheULH/ErL9TN7ih20E2dmQ2T5MeoOEe4CbvdK9d8k4GOLyvWWcTw8mj1PVPHLhBjSYSaNdZg
	YiA+VZkPbSq5g+UbobWPFcDoa68yY3zeSiVoEA6kSaLHQp8RMRxRfn63Z+iWNCu9cu0CLWCBlf2
	VeDvrKRh6BqSD962KYR+ozlvnuXe4ii9vPQFyX/howdlsyKXfwB/62TwMAI+J/jeYau3TqOX9un
	16pIzGnvVxCQh3Y3qTpxpSbQGodXTUZeVvEs0EJrsTDab7U1rs59E
X-Received: by 2002:a05:6214:401:b0:707:419d:2e28 with SMTP id 6a1803df08f44-707419d33aamr57187516d6.41.1753695863264;
        Mon, 28 Jul 2025 02:44:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSFwEBe/2mm24nadIjbBi00JjeMT/2cBqpF+9f5PXZDrO8IXpWYX2OiIxMU2L7zeyH96PryQ==
X-Received: by 2002:a05:6214:401:b0:707:419d:2e28 with SMTP id 6a1803df08f44-707419d33aamr57187146d6.41.1753695862738;
        Mon, 28 Jul 2025 02:44:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63394014sm1183804e87.180.2025.07.28.02.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:21 -0700 (PDT)
Date: Mon, 28 Jul 2025 12:44:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Message-ID: <3gtlf5txxtioa5bvo6o467jupyoam4hjhm2mdiw5izv5vbl3tz@drndgp3tcrgo>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
 <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
X-Proofpoint-GUID: a3TNpvKbMlugz6La4QKRx7_CIyj9-mxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA3MSBTYWx0ZWRfXxj2pngcprXlr
 lu/lMEkjLzcQb2NhTG5V+2/1FEil0BV/1UAQckYdioezgEll5k1ISnB8F9Ji9+0HkDWserwfAd9
 ch/D/tO8ch0yianb291zc3OdBT562FZyiy81cC9Dggd5k3gv5d7AojLWx44qb/Ph76R6hjqYB0V
 N0NmRJwvJE2IMJD3ViwA/x6FB/EQyRhHdzLbMPofumFbDJxdNTJ6UgmuEBt5hcvFIWkbg9mNl/+
 3f4g31b7KHDHGhKNgKCQWQmpvDihijTHAUQIuIz1YQu1ZJJnI4ODEplhYDJMyxntuzAZDCbeTiP
 g/rwsHtyr51A2ua64mOSWYNgT1pMmIIrmujGQ268Dg8S/+AeYywjYg9spSnG79shQn3A7ndz10m
 pJ8ILICHu0mdYKgxyB4io4AXI/ZbPIOHzun1Fb4Jk6gU2GebOGLyIkXhem1vSZeJZZtI5C7t
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=68874678 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=fdSrWZEoeHojn4nDOlUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: a3TNpvKbMlugz6La4QKRx7_CIyj9-mxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024426_078096_E70DE25A 
X-CRM114-Status: GOOD (  18.30  )
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

On Mon, Jul 28, 2025 at 06:53:14AM +0200, Krzysztof Kozlowski wrote:
> On 27/07/2025 18:24, Shivendra Pratap wrote:
> > +
> > +static int __init psci_init_vendor_reset(void)
> > +{
> > +	struct reboot_mode_driver *reboot;
> > +	struct device_node *np;
> > +	int ret;
> > +
> > +	np = of_find_node_by_path("/psci/reboot-mode");
> 
> 
> Why are you looking by full path, not by compatible? Is the ABI - above
> path - expressed anywhere?

PSCI node is required to have a node name of psci, it doesn't have MMIO,
so it resides in the root node and the reboot-mode is defined in the
previous patch. So, I'd assume, the path is defined.

However the question might be slightly different: why do we need a
separate initcall for reboot handling? The reasons for that need to be
documented in the commit message.

-- 
With best wishes
Dmitry

