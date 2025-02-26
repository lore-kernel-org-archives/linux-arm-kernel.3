Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38ECC19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 18:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MITHVxmcAQ6A43ETluCVH8qktHM9iyaVcLEvG9Imcc0=; b=cpqkbCgmC/Fsb137jmV2KVqNAI
	G7z5xJtj/S5K0RvGSYol6sivh10TeZiJOe4M0O/BOdPkUtN6ZZIadR+bUM6RoTzEo8+G0XZ/feMem
	Pxajlsfy3UCWpsRveoEro8LRi7c9mawSGHw6J2mRXQK4UEO1Tcit6iZ5JOnVwFqH/J5JKY/wJH4ad
	hUSLGP5viUc1dksSs5uO+vr9jtSjPf0SNhjPrKWsd8Dq2bJ6r5Iv4gE0E3uMBaWzdRN6CXw5SUI9o
	CAoGzMZBpHsQa7yeZ5iafQOWNeaAtlr0wwgQzNae3rnYfoDKYq7GPwEEZQyCJ+kypVv+TXcDHCb13
	vnTtPaWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMUn-000000052dE-3Cb3;
	Wed, 26 Feb 2025 18:51:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMTE-000000052Bf-3RaO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 18:49:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QD9AeQ001059
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 18:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MITHVxmcAQ6A43ETluCVH8qk
	tHM9iyaVcLEvG9Imcc0=; b=DnF3rouf+nplhh4zddEr6fKmz9N/DWigWG+ZNOVq
	v0h2EbK6YIEi9YyRZFRod5ya6bj+mxq1uAQTh2PcYNktHXF/+RtV7pg6+K9j25tL
	2mIBkb+Ldrkj9/H3+aeUo+/eI2VQ8Di9WpqrVHsWy9onkkTpTazjeDoSC/UQF0ZH
	NUI/P4HmNZucyUX5ZsMim7VGq36MpjUJyhzUZ12fz7k8IKEavvguRkkMP7ZlwxLo
	B8KjMH1jp5zZr0i5zINPpuVDTL8zcfstIW3Xm21ribnyM+uvgsSp2C5NWHpb2/k8
	85YLzIPZGYx24acms0w2dlwEIQMgCeVP5mofjoOk52v0nQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4523kc8xk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 18:49:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2210121ac27so1205975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 10:49:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740595763; x=1741200563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MITHVxmcAQ6A43ETluCVH8qktHM9iyaVcLEvG9Imcc0=;
        b=vRN9mZ1QX39QT7qJZY+pbGXnJNuNQzxWyJgOUl2W5sH0iUQbSE6z831ZdzYkvp15NP
         2aPWz5W1BBMsummodt8VCoTs0MWOZY4/lnD1LExB5PhtzCS5EmISQqCJp4nuHEaz0ACx
         ZcLrXfBPpapSjefPhG8EJzcUP804i9Bo5jah14hE3GuFXNeJUYETQZpd7T9aXLMXF1jJ
         pOfVE9mFtmGz+NCL4KLt4s1fXWahjHsEyd12RElP7EQh7vi+FQ1YyLXxGbUxcp2Qe2iL
         KeYr1tr8xKlYmuotaM290W+RLiZQYZz0E2cIDl7DulkoZd45+okzcMZu7gMA4RQgSkbr
         1clA==
X-Forwarded-Encrypted: i=1; AJvYcCWUgXRcfCo2X0yAtXpKx7n1If+ZqBLud25ps5O3J/jYfPEnyZZBmNLk813CyUGq9tSrM2qK+Gw5SVUBtxtemLkq@lists.infradead.org
X-Gm-Message-State: AOJu0YzL1cDk6mPvaZbhGEw4WqwgbVl6hU99pG31njvJbeX2brHd9Yl7
	o07Dru+vNIuc6Sl4omk7DHeIeGh3ZFDSbEBhlC84kqY1JPBxvj53igftqUEC+wMAdliq5/G3YFA
	KkWjBZR3+QqgTTz9tDbfqpnqwoeTS41L/oNLs33J98BuYws8jHBqwbTjYtz9wf/lep7tZxFV+hg
	==
X-Gm-Gg: ASbGnctDqI2oeuvo2DHL9L1tfyNRySL95rL3XliBbBywGZ3doeiZ4VYm5ERLWVkQbC9
	wDVNdvk07+Xw7oqVV0Osv+kAUw3j60OuWQzOvEe+QbA4EvUH/fA7xb53GlK5Ny1np5ma1MPRpdn
	Jjb5Y9Tczg2m/9HnjTMd8lLjUTQq/dVRMwvqpdhXzrpAuTlSv7veZKdWvnTiJRO29T7WbTx1iAE
	GqjoCy4v2wGtGxLvUq//OsDkdO6mY6Gs6t8j5pU77mNGH855hNfkguT3ktd/6Z83UclbhyjjzoF
	8mIFvmrMH/AEMeqJcVNCH9q9ud0L2stPwj5EEmu1RnN+obN5+mV4gYFJLf8XohHQhPIOtyE=
X-Received: by 2002:a17:903:40d1:b0:220:d79f:60f1 with SMTP id d9443c01a7336-2232020856bmr63132745ad.42.1740595762866;
        Wed, 26 Feb 2025 10:49:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRjzWrcltS/SmKz3Q5inlltvidwmKOdKizJT4TsTs1McdWObFowvI+RYwMenjlWzuLSoAsJA==
X-Received: by 2002:a17:903:40d1:b0:220:d79f:60f1 with SMTP id d9443c01a7336-2232020856bmr63132325ad.42.1740595762411;
        Wed, 26 Feb 2025 10:49:22 -0800 (PST)
Received: from hu-eberman-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0944d4sm36517005ad.140.2025.02.26.10.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 10:49:22 -0800 (PST)
Date: Wed, 26 Feb 2025 10:49:20 -0800
From: Elliot Berman <elliot.berman@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Shivendra Pratap <quic_spratap@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 3/6] firmware: psci: Read and use vendor reset types
Message-ID: <20250226101913390-0800.eberman@hu-eberman-lv.qualcomm.com>
References: <20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com>
 <20241107-arm-psci-system_reset2-vendor-reboots-v8-3-e8715fa65cb5@quicinc.com>
 <Z78lH/XErc7G8bL9@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z78lH/XErc7G8bL9@lpieralisi>
X-Proofpoint-GUID: hoghFI74elQytla03Zll9nCijU4n2O3N
X-Proofpoint-ORIG-GUID: hoghFI74elQytla03Zll9nCijU4n2O3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 clxscore=1011 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_104924_867768_6BFCFA5A 
X-CRM114-Status: GOOD (  50.39  )
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

On Wed, Feb 26, 2025 at 03:28:47PM +0100, Lorenzo Pieralisi wrote:
> On Thu, Nov 07, 2024 at 03:38:27PM -0800, Elliot Berman wrote:
> > SoC vendors have different types of resets and are controlled through
> > various registers. For instance, Qualcomm chipsets can reboot to a
> > "download mode" that allows a RAM dump to be collected. Another example
> > is they also support writing a cookie that can be read by bootloader
> > during next boot. PSCI offers a mechanism, SYSTEM_RESET2, for these
> > vendor reset types to be implemented without requiring drivers for every
> > register/cookie.
> > 
> > Add support in PSCI to statically map reboot mode commands from
> > userspace to a vendor reset and cookie value using the device tree.
> > 
> > A separate initcall is needed to parse the devicetree, instead of using
> > psci_dt_init because mm isn't sufficiently set up to allocate memory.
> > 
> > Reboot mode framework is close but doesn't quite fit with the
> > design and requirements for PSCI SYSTEM_RESET2. Some of these issues can
> > be solved but doesn't seem reasonable in sum:
> >  1. reboot mode registers against the reboot_notifier_list, which is too
> >     early to call SYSTEM_RESET2. PSCI would need to remember the reset
> >     type from the reboot-mode framework callback and use it
> >     psci_sys_reset.
> >  2. reboot mode assumes only one cookie/parameter is described in the
> >     device tree. SYSTEM_RESET2 uses 2: one for the type and one for
> >     cookie.
> >  3. psci cpuidle driver already registers a driver against the
> >     arm,psci-1.0 compatible. Refactoring would be needed to have both a
> >     cpuidle and reboot-mode driver.
> > 
> > Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> > ---
> >  drivers/firmware/psci/psci.c | 104 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> > 
> > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > index 2328ca58bba61fdb677ac20a1a7447882cd0cf22..e60e3f8749c5a6732c51d23a2c1f453361132d9a 100644
> > --- a/drivers/firmware/psci/psci.c
> > +++ b/drivers/firmware/psci/psci.c
> > @@ -79,6 +79,14 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void)
> >  static u32 psci_cpu_suspend_feature;
> >  static bool psci_system_reset2_supported;
> >  
> > +struct psci_reset_param {
> > +	const char *mode;
> > +	u32 reset_type;
> > +	u32 cookie;
> > +};
> > +static struct psci_reset_param *psci_reset_params __ro_after_init;
> > +static size_t num_psci_reset_params __ro_after_init;
> > +
> >  static inline bool psci_has_ext_power_state(void)
> >  {
> >  	return psci_cpu_suspend_feature &
> > @@ -305,9 +313,38 @@ static int get_set_conduit_method(const struct device_node *np)
> >  	return 0;
> >  }
> >  
> > +static void psci_vendor_system_reset2(const char *cmd)
> > +{
> > +	unsigned long ret;
> > +	size_t i;
> > +
> > +	for (i = 0; i < num_psci_reset_params; i++) {
> > +		if (!strcmp(psci_reset_params[i].mode, cmd)) {
> > +			ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> > +					     psci_reset_params[i].reset_type,
> > +					     psci_reset_params[i].cookie, 0);
> > +			/*
> > +			 * if vendor reset fails, log it and fall back to
> > +			 * architecture reset types
> > +			 */
> > +			pr_err("failed to perform reset \"%s\": %ld\n", cmd,
> > +			       (long)ret);
> > +			return;
> > +		}
> > +	}
> > +}
> > +
> >  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> >  			  void *data)
> >  {
> > +	/*
> > +	 * try to do the vendor system_reset2
> > +	 * If the reset fails or there wasn't a match on the command,
> > +	 * fall back to architectural resets
> > +	 */
> > +	if (data && num_psci_reset_params)
> > +		psci_vendor_system_reset2(data);
> 
> Mulling over this. If a command (data) was provided and a PSCI vendor
> reset parsed at boot, if the vendor reset fails, isn't it correct to
> just fail reboot instead of falling back to architectural resets ?
> 

Sure! I can change the behavior here.

> What's missing is defining the "contract" between the
> LINUX_REBOOT_CMD_RESTART2 arg parameter and the kernel reboot
> type that is executed.
> 
> I do wonder whether this is an opportunity to deprecate reboot_mode
> altogether on arm64 (I think that the relationship between REBOOT_WARM
> and REBOOT_SOFT with PSCI arch warm reset is already loose - let alone
> falling back to cold reset if reboot_mode == REBOOT_GPIO - which does
> not make any sense at all simply because REBOOT_GPIO is ill-defined to
> say the least).
> 
> Thoughts ?
> 

I'm not opposed to seeing how we can deprecate the reboot_mode enum for
arm64, but I think this should be an independent effort from the vendor
resets. I'm worried this takes us down the "don't let perfect be the
enemy of good" path to support vendor resets. I haven't seen much
interest in this issue outside the two of us, and thus changing
important infrastructure like reboot seems to me to be a long shot.

Thanks,
Elliot

