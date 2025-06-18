Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C4CC73C66
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7pPr07uK/MO7S0+vu1FGmwyIRKndt0ZmMbzbptnkmU=; b=xD7zVOIwKrZkPA/bKn7WSjq1Y7
	RN4uGh8q38aLw2gnKtVBOYJLX3sCyBQRiPIzukUjXF7/V6F0d54TmhgNoKVrI9/hSc6KPIGfADANV
	xgXGShvqf99QwK1RzlaRwxt/hVN2PpXF2RGXOU+o9hJZYEdIKW4Tx1vHXqhEkK4X3Gsp7Wgn5+7zc
	oL5cjSFYUt6GbHXwgzrbKbyb5g7CWdwFqQtwbnwOpOnroFHORDNSrz2qVvOJomQb4/on+zmCuidrL
	nufmQv+8QIMXsMa0YZdhRb/CUMg8DhEkCcJsRGNrS3qpcwgJ1O3ZM8pKz2J7f6b+zmMN2vk2fbQcH
	7i7Caelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyBu-0000000B9KN-2rdR;
	Wed, 18 Jun 2025 19:11:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRscp-0000000AGIZ-1vod
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 13:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m7pPr07uK/MO7S0+vu1FGmwyIRKndt0ZmMbzbptnkmU=; b=almnhqfUoABQiN7M5nfdZYekns
	kO/kQvKe7i+0xq8HUyGhxYPSEIYUS6q7IyNvDSDppjwvZhk8xEI44Nw9Xit0ui0h78GIVdNM4SMs3
	M5KrreDwOxYX3c/dvcG2so0lBJU7VJ4cRiClbja0iwE15IM08ok75ag3cwtgm2mU/73HuUK2Tpz5K
	xODj5dkNdW5T5CElAzWxshwjobIHwsJYCvG6IkgOxE4/zuux1G40/W38UXNDHg0abcSAEJem/kuA7
	WLDE2x4x6GwgjNitsgAAvV/F0gAm5hVd/MCVO/EQwlu7V7HC+Z8G/bl75DTjY/3t+KYfSrphj5Luz
	AMDRnDAg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRscm-000000042ql-2Z3P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:14:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9oD4F014411
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 13:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m7pPr07uK/MO7S0+vu1FGmwy
	IRKndt0ZmMbzbptnkmU=; b=Y3NRHQz3pgblNX/79jJHV0DLyPwEDvhQNkumtxwY
	KSSgrY2PciBzzUGuCi2IR3497qQDR7euUk/eIB8aq5NUMMLCTKBjpvGmQCQzZ9HE
	XvsxWthlfs2XqKvlglBIRUakhMxikwneFYaVVa+q6H4lsOsu7Rd/4g5X3h6dGvk/
	TAP9u1rkL8er4SiFi4YYcCnYoZ5+mC0Ui9+o1poCyOwcoS/UWE6OWmik/RvklMkl
	5qzPd3wXDInGEGnf3rk3vXPCyOSYW6BDdjQfyXLNJc5PyhjqKrOaXj3HuJpbMELH
	3CHNMxZvK2TUB3td2wdHSqyTD8YhFB2LLPfCr/nTAdzdlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crv1fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 13:14:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d099c1779dso1161815785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 06:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750252478; x=1750857278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7pPr07uK/MO7S0+vu1FGmwyIRKndt0ZmMbzbptnkmU=;
        b=QcgVot8BT6U/WPK4EYzVujjPNu5DO5yxv+GYqJYp+4yiJYCpl8ZqCh4QblOKEiu1VX
         +h/6fe9Hn0nWNyIRu2BJjAI9zFcwVhvvD4FEuohKogDuE4VDs+7Vc63aa1x8eOh2Ryvh
         iySzD9OAEd1Fwwc3q8IUqXd07AVwGaB0ROb9dVz00SJypq7SvbhyuyRaljlSHiKiupJr
         VGk7X54a2TzIyub2yc+k4fgWNyYjYmzam5hU5K/kzBUl+GcjQ9T+uRrFIQ7/qxci3Tlb
         MTYcQ7JskyUTaziO9aDN2tYZ8dKQXWqeGAZbXKoiBSqAHXjEFmp/s+FsYknRil2S6LFL
         Ivqg==
X-Forwarded-Encrypted: i=1; AJvYcCVlStYunbeQMScBswwhkh08MCOuiPGQ38gdH7fE7cab/O/LUxMCQPbcOq8Dq+Qvr2MecbPUygUC3oFiL7hYS9K/@lists.infradead.org
X-Gm-Message-State: AOJu0YyQyJvKAl1D7q+J+ognscYHcTxp9KCK5cFHhnTc/X+aCR9v+fOQ
	f+gj/OQlFVIeTb96NVc/Po78FTNoBm2vPBdNvjhkVtLuakqLKwNB1fFvNVa/45iYZiGVLXSTN1c
	TioCTpKcH0GsDvm2vZsWq75JQtJA5fFD4u0jGTIEc2VPFK+4CK+bPOCdV3WljzNl15vpCfZuBYu
	wV5g==
X-Gm-Gg: ASbGnctDJEwkSTqahH/MR63e1V+8X4YxS3tks2WpQr5Vfm6mdmZitnauNpGPERyDSvd
	RYy1OkXCEpEJlg65ECDE9fSiT3Aw4iigsTqrzalN6Ho7D3Ikd1H6m0YfR5cFTa0fL4d+r648mkk
	ybB7/v/KIrlSB71OwPMJoB9+WNT+bezKZKHmg6nveWgUGQq68A6huXbeUitbyR8t6fu4tjUN94b
	xTDejTcObVMWfdTOO6Y8YKF7lv4+R4rlXghV5rjpNuG0rO0WMChu2F1KPNRfxu1/oewmwwNYdVv
	L5vmE1btkfTEc3bJEEhkHz510yxWyiYbTn0P0Q+B2pUpeVIshM93UZhjmamE/epWwoVcGfMBjC8
	3nhSSA3ksngOjIbYqmlokDXXU59lr/Iw3tY0=
X-Received: by 2002:a05:620a:440f:b0:7ca:f02a:4d2b with SMTP id af79cd13be357-7d3c6c0d3b0mr2494973785a.12.1750252477496;
        Wed, 18 Jun 2025 06:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA8A1wCa+lNoHoi9aZDSTVEUTqllBLepRhgBUA+jlwu8cJiBPuW7WORbByYRdCn80uO0XdsQ==
X-Received: by 2002:a05:620a:440f:b0:7ca:f02a:4d2b with SMTP id af79cd13be357-7d3c6c0d3b0mr2494967485a.12.1750252476904;
        Wed, 18 Jun 2025 06:14:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553d51b1d52sm138017e87.65.2025.06.18.06.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:14:36 -0700 (PDT)
Date: Wed, 18 Jun 2025 16:14:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shivendra Pratap <quic_spratap@quicinc.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
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
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Elliot Berman <elliotb317@gmail.com>,
        quic_spratap@qucinc.com,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        quic_kaushalk@qucinc.com
Subject: Re: [PATCH v9 2/5] firmware: psci: Read and use vendor reset types
Message-ID: <rz7tnl5gg73gtyij3kmwk6hubikfsvu3krekjkpoofpdio6cwe@innio7qvotye>
References: <20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com>
 <20250303-arm-psci-system_reset2-vendor-reboots-v9-2-b2cf4a20feda@oss.qualcomm.com>
 <Z9QQw6BcE7IXzu+r@lpieralisi>
 <Z+K3uNjTNbq3pUis@hu-mojha-hyd.qualcomm.com>
 <Z/U95G+2GsoLD6Mi@lpieralisi>
 <973eaca7-0632-53d8-f892-fe4d859ebbac@quicinc.com>
 <Z/+dGLAGXpf9bX7G@lpieralisi>
 <e96e315c-69fb-bc7e-5d07-06909344ff65@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e96e315c-69fb-bc7e-5d07-06909344ff65@quicinc.com>
X-Proofpoint-ORIG-GUID: kSvqX0RU05Vf4Lwopz-5MLm-r8x1zeTc
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=6852bbbe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=GcyzOjIWAAAA:8 a=EUspDBNiAAAA:8 a=u11vpO89wc5r4MctJj4A:9
 a=CjuIK1q_8ugA:10 a=dtxw0mqMjrQA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=hQL3dl6oAZ8NdCsdz28n:22
X-Proofpoint-GUID: kSvqX0RU05Vf4Lwopz-5MLm-r8x1zeTc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExMiBTYWx0ZWRfX6iEGIEUhFz8D
 Uv+wnCgROCHDi1CvVFrCHqdN8qBWl5ijfc+FbB0VkJLM3lyUP3y7dK9s/74PLgaRvPIOjf/GefE
 NiqilOeLRlZ0ztjNUWhw9Pb/zuEhRlczaV+Tb/fus1Q3qAX6sjNQSnopPEkvbU9yVLP7G0wmqCp
 H8CFN2PamascrZhj8ac7MuC5eX1DR93666EC56fXgzrgB1tcqeKLPupgi9CcICzSAp0xdgvRtJE
 YRfP2L9SP8cQZh+ZymwuZjoxZx3qDfaLqwDGVF+WkpBKcVfstf/lfoDqiw4TlAhU5GkO5gx1LIP
 IGIqqrAB+GuQF1OXqMcdYF3N7rCj6PA5UqqAeATq57nZ2m8WxAsO1iF4TDZ0EwoEW9Z5LmeJMEA
 XeFFJEtI13PQYyuj62bBXx4nVXfWiiNbiz61WEgbpk/1qoNRy3zI6yqk0ev4l8HRPCzXBymN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_141444_990762_0F8290AF 
X-CRM114-Status: GOOD (  68.23  )
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

On Tue, May 06, 2025 at 11:03:55PM +0530, Shivendra Pratap wrote:
> 
> 
> On 4/16/2025 5:35 PM, Lorenzo Pieralisi wrote:
> > On Wed, Apr 09, 2025 at 11:48:24PM +0530, Shivendra Pratap wrote:
> >>
> >>
> >> On 4/8/2025 8:46 PM, Lorenzo Pieralisi wrote:
> >>> On Tue, Mar 25, 2025 at 07:33:36PM +0530, Mukesh Ojha wrote:
> >>>> On Fri, Mar 14, 2025 at 12:19:31PM +0100, Lorenzo Pieralisi wrote:
> >>>>> On Mon, Mar 03, 2025 at 01:08:31PM -0800, Elliot Berman wrote:
> >>>>>> From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> >>>>>>
> >>>>>> SoC vendors have different types of resets and are controlled through
> >>>>>> various registers. For instance, Qualcomm chipsets can reboot to a
> >>>>>> "download mode" that allows a RAM dump to be collected. Another example
> >>>>>> is they also support writing a cookie that can be read by bootloader
> >>>>>> during next boot. PSCI offers a mechanism, SYSTEM_RESET2, for these
> >>>>>> vendor reset types to be implemented without requiring drivers for every
> >>>>>> register/cookie.
> >>>>>>
> >>>>>> Add support in PSCI to statically map reboot mode commands from
> >>>>>> userspace to a vendor reset and cookie value using the device tree.
> >>>>>
> >>>>> I have managed to discuss a little bit this patchset over the last
> >>>>> few days and I think we have defined a plan going forward.
> >>>>>
> >>>>> A point that was raised is:
> >>>>>
> >>>>> https://man7.org/linux/man-pages/man2/reboot.2.html
> >>>>>
> >>>>> LINUX_REBOOT_CMD_RESTART2 *arg command, what is it supposed to
> >>>>> represent ?
> >>>>>
> >>>>> Is it the mode the system should reboot into OR it is the
> >>>>> actual command to be issued (which is what this patchset
> >>>>> implements) ?
> >>>>>
> >>>>> LINUX_REBOOT_CMD_RESTART "..a default restart..."
> >>>>>
> >>>>> It is unclear what "default" means. We wonder whether the
> >>>>> reboot_mode variable was introduced to _define_ that "default".
> >>>>>
> >>>>> So, in short, my aim is trying to decouple reboot_mode from the
> >>>>> LINUX_REBOOT_CMD_RESTART2 *arg command.
> >>>>>
> >>>>> I believe that adding a sysfs interface to reboot-mode driver
> >>>>> infrastructure would be useful, so that the commands would
> >>>>> be exposed to userspace and userspace can set the *arg command
> >>>>> specifically to issue a given reset/mode.
> >>>>>
> >>>>> I wonder why this is not already in place for eg syscon-reboot-mode
> >>>>> resets, how does user space issue a command in those systems if the
> >>>>> available commands aren't exposed to userspace ?
> >>>>>
> >>>>> Is there a kernel entity exposing those "modes" to userspace, somehow ?
> >>>>>
> >>>>>> A separate initcall is needed to parse the devicetree, instead of using
> >>>>>> psci_dt_init because mm isn't sufficiently set up to allocate memory.
> >>>>>>
> >>>>>> Reboot mode framework is close but doesn't quite fit with the
> >>>>>> design and requirements for PSCI SYSTEM_RESET2. Some of these issues can
> >>>>>> be solved but doesn't seem reasonable in sum:
> >>>>>>  1. reboot mode registers against the reboot_notifier_list, which is too
> >>>>>>     early to call SYSTEM_RESET2. PSCI would need to remember the reset
> >>>>>>     type from the reboot-mode framework callback and use it
> >>>>>>     psci_sys_reset.
> >>>>>>  2. reboot mode assumes only one cookie/parameter is described in the
> >>>>>>     device tree. SYSTEM_RESET2 uses 2: one for the type and one for
> >>>>>>     cookie.
> >>>>>
> >>>>> This can be changed and I think it should, so that the reboot modes
> >>>>> are exposed to user space and PSCI can use that.
> >>>>>
> >>>> In the case of a regular reboot or panic, the reboot/panic notifiers run
> >>>> first, followed by the restart notifiers. The PSCI reset/reset2 should
> >>>> be the last call from Linux, and ideally, this call should not fail.
> >>>>
> >>>> Reboot mode notifiers => restart notifiers or Panic notifiers => restart
> >>>> notifiers
> >>>>
> >>>> So, if I understand correctly, you mean that we can change the reboot
> >>>> mode framework to expose the arguments available to user space. We can
> >>>> extend it to accept magic and cookies, save them in the reboot
> >>>> framework, and retrieve them via a call from PSCI during a regular
> >>>> reboot or panic based on the current arguments. Is this leading towards
> >>>> writing an ARM-specific PSCI-reboot-mode driver, which in its reboot
> >>>> notifier callback saves the magic and cookies, and these magic and
> >>>> cookies will be used during psci_sys_reset2()? Or is there something
> >>>> wrong with my understanding?
> >>>
> >>> No, you got it right (apologies for the delay in replying) - if the
> >>> case for making reboot mode available to user space is accepted.
> >>>
> While moving this into reboot-mode framework, one more query came up.
> The "ARM-specific PSCI-reboot-mode driver" that we are going to write needs
> to be a Platform device driver for using reboot-mode framework.

No, it doesn't. It rqeuires struct device, but there is no requirement
for struct platform_device at any place.

> As psci is not a platform device driver, a subdevice under it may not probe as a
> platform driver. Is it ok to implement the "PSCI-reboot-mode driver" as a
> early_initcall("psci_xyz") and then create a platform device something as
> below or any other suggestions for this?

Change struct reboot_mode_driver to pass corresponding of_node (or
better fwnode) directly.  Corresponding device is used only in the
reboot_mode_register() and only to access of-node or to print error
messages.

> 
> power:reset:<psci-vendor-reset-driver>:
> -----
> static int __init psci_vendor_reset_init(void) {
> ..
> ..
> 	np = of_find_node_by_name(NULL, "psci-vendor-reset");
> 	if(!np)
> 		return -ENODEV;
> 	pdev = of_platform_device_create(np, "psci-vendor-reset", NULL);
> ..
> ..
> }
> -------
> 
> the sysfs we will expose from reboot-mode may show like below in above 
> implementation:
> 
> ###### 
> / # cat ./sys/devices/platform/psci-vendor-reset/available_modes
> bootloader edl 
> ###### 
> 
> thanks,
> Shivendra
> 
> >>
> >> Agree that the available modes should be exposed to usespace via sysfs interface
> >> and we should implement it. Also #1 and #2 can be handled via some
> >> changes in the design as mentioned in above discussion.
> >>
> >> I have one doubt though when we implement this via reboot-mode framework.
> >> The current patch implements PSCI ARM PSCI SYSTEM RESET2 vendor reset types.
> >> psci driver is initialized very early at boot but potential ARM psci reboot-mode
> >> driver will not probe at that stage and the ARM PSCI SYSTEM RESET2 vendor reset
> >> types functionality will not be available in psci reset path until the reboot-mode
> >> driver probes. Will this cause any limitation on usage of ARM's PSCI vendor-reset
> >> types for early device resets?
> >>
> >> One use-case may be an early device crash or a early reset where a vendor 
> >> wants to use PSCI SYSTEM RESET2 vendor reset type to a reset the device to a 
> >> specific state but may not be able to use this driver.
> >> (eg: a kernel panic at early boot where a vendor wants to reset device 
> >> to a specific state using vendor reset. Currently panic passes a NULL
> >> (*arg command) while device reset but it may be explored for vendor specific
> >> reset).
> > 
> > As you said, that would not be a PSCI only issue - *if* we wanted to
> > plug in this use case we should find a way to do it at reboot mode
> > driver level.
> > 
> > As a matter of fact, this is not a mainline issue AFAICS.
> > 
> > Even if we did not design this as a reboot mode driver there would be a
> > time window where you would not be able to use vendor resets on panic.
> > 
> > I don't see it as a major roadblock at the moment.
> Got it.
> > 
> > Thanks,
> > Lorenzo
> > 
> >>
> >> - Shivendra
> >>
> >>>> P.S. We appreciate Elliot for his work and follow-up on this while being
> >>>> employed at Qualcomm.
> >>>
> >>> Yes I sincerely do for his patience, thank you.
> >>>
> >>> Lorenzo
> >>>
> >>>>>>  3. psci cpuidle driver already registers a driver against the
> >>>>>>     arm,psci-1.0 compatible. Refactoring would be needed to have both a
> >>>>>>     cpuidle and reboot-mode driver.
> >>>>>>
> >>>>>> Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>  drivers/firmware/psci/psci.c | 105 +++++++++++++++++++++++++++++++++++++++++++
> >>>>>>  1 file changed, 105 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> >>>>>> index a1ebbe9b73b136218e9d9f9b8daa7756b3ab2fbe..6f8c47deaec0225f26704e1f3bcad52603127a85 100644
> >>>>>> --- a/drivers/firmware/psci/psci.c
> >>>>>> +++ b/drivers/firmware/psci/psci.c
> >>>>>> @@ -80,6 +80,14 @@ static u32 psci_cpu_suspend_feature;
> >>>>>>  static bool psci_system_reset2_supported;
> >>>>>>  static bool psci_system_off2_hibernate_supported;
> >>>>>>  
> >>>>>> +struct psci_reset_param {
> >>>>>> +	const char *mode;
> >>>>>> +	u32 reset_type;
> >>>>>> +	u32 cookie;
> >>>>>> +};
> >>>>>> +static struct psci_reset_param *psci_reset_params __ro_after_init;
> >>>>>> +static size_t num_psci_reset_params __ro_after_init;
> >>>>>> +
> >>>>>>  static inline bool psci_has_ext_power_state(void)
> >>>>>>  {
> >>>>>>  	return psci_cpu_suspend_feature &
> >>>>>> @@ -306,9 +314,39 @@ static int get_set_conduit_method(const struct device_node *np)
> >>>>>>  	return 0;
> >>>>>>  }
> >>>>>>  
> >>>>>> +static int psci_vendor_system_reset2(const char *cmd)
> >>>>>> +{
> >>>>>> +	unsigned long ret;
> >>>>>> +	size_t i;
> >>>>>> +
> >>>>>> +	for (i = 0; i < num_psci_reset_params; i++) {
> >>>>>> +		if (!strcmp(psci_reset_params[i].mode, cmd)) {
> >>>>>> +			ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> >>>>>> +					     psci_reset_params[i].reset_type,
> >>>>>> +					     psci_reset_params[i].cookie, 0);
> >>>>>> +			/*
> >>>>>> +			 * if vendor reset fails, log it and fall back to
> >>>>>> +			 * architecture reset types
> >>>>>
> >>>>> That's not what the code does.
> >>>>>
> >>>> Ack.
> >>>>
> >>>> -Mukesh
> >>>>
> >>>>>> +			 */
> >>>>>> +			pr_err("failed to perform reset \"%s\": %ld\n", cmd,
> >>>>>> +			       (long)ret);
> >>>>>> +			return 0;
> >>>>>> +		}
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	return -ENOENT;
> >>>>>> +}
> >>>>>> +
> >>>>>>  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> >>>>>>  			  void *data)
> >>>>>>  {
> >>>>>> +	/*
> >>>>>> +	 * try to do the vendor system_reset2
> >>>>>> +	 * If there wasn't a matching command, fall back to architectural resets
> >>>>>> +	 */
> >>>>>> +	if (data && !psci_vendor_system_reset2(data))
> >>>>>> +		return NOTIFY_DONE;
> >>>>>> +
> >>>>>>  	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> >>>>>>  	    psci_system_reset2_supported) {
> >>>>>>  		/*
> >>>>>> @@ -795,6 +833,73 @@ static const struct of_device_id psci_of_match[] __initconst = {
> >>>>>>  	{},
> >>>>>>  };
> >>>>>>  
> >>>>>> +#define REBOOT_PREFIX "mode-"
> >>>>>> +
> >>>>>> +static int __init psci_init_system_reset2_modes(void)
> >>>>>> +{
> >>>>>> +	const size_t len = strlen(REBOOT_PREFIX);
> >>>>>> +	struct psci_reset_param *param;
> >>>>>> +	struct device_node *psci_np __free(device_node) = NULL;
> >>>>>> +	struct device_node *np __free(device_node) = NULL;
> >>>>>> +	struct property *prop;
> >>>>>> +	size_t count = 0;
> >>>>>> +	u32 magic[2];
> >>>>>> +	int num;
> >>>>>> +
> >>>>>> +	if (!psci_system_reset2_supported)
> >>>>>> +		return 0;
> >>>>>> +
> >>>>>> +	psci_np = of_find_matching_node(NULL, psci_of_match);
> >>>>>> +	if (!psci_np)
> >>>>>> +		return 0;
> >>>>>> +
> >>>>>> +	np = of_find_node_by_name(psci_np, "reset-types");
> >>>>>> +	if (!np)
> >>>>>> +		return 0;
> >>>>>
> >>>>> Related to my initial question above. If LINUX_REBOOT_CMD_RESTART2 *arg command,
> >>>>> is the actual reset to be issued, should we add a default mode "cold"
> >>>>> and, if SYSTEM_RESET2 is supported, a "warm" reset mode too ?
> >>>>>
> >>>>> It all boils down to what *arg represents - adding "cold" and "warm"
> >>>>> modes would remove the dependency on reboot_mode for resets issued
> >>>>> through LINUX_REBOOT_CMD_RESTART2, the question is whether this
> >>>>> is the correct thing to do.
> >>>>>
> >>>>> Comments very welcome.
> >>>>>
> >>>>> Thanks,
> >>>>> Lorenzo
> >>>>>
> >>>>>> +
> >>>>>> +	for_each_property_of_node(np, prop) {
> >>>>>> +		if (strncmp(prop->name, REBOOT_PREFIX, len))
> >>>>>> +			continue;
> >>>>>> +		num = of_property_count_u32_elems(np, prop->name);
> >>>>>> +		if (num != 1 && num != 2)
> >>>>>> +			continue;
> >>>>>> +
> >>>>>> +		count++;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	param = psci_reset_params =
> >>>>>> +		kcalloc(count, sizeof(*psci_reset_params), GFP_KERNEL);
> >>>>>> +	if (!psci_reset_params)
> >>>>>> +		return -ENOMEM;
> >>>>>> +
> >>>>>> +	for_each_property_of_node(np, prop) {
> >>>>>> +		if (strncmp(prop->name, REBOOT_PREFIX, len))
> >>>>>> +			continue;
> >>>>>> +
> >>>>>> +		num = of_property_read_variable_u32_array(np, prop->name, magic,
> >>>>>> +							  1, ARRAY_SIZE(magic));
> >>>>>> +		if (num < 0) {
> >>>>>> +			pr_warn("Failed to parse vendor reboot mode %s\n",
> >>>>>> +				param->mode);
> >>>>>> +			kfree_const(param->mode);
> >>>>>> +			continue;
> >>>>>> +		}
> >>>>>> +
> >>>>>> +		param->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
> >>>>>> +		if (!param->mode)
> >>>>>> +			continue;
> >>>>>> +
> >>>>>> +		/* Force reset type to be in vendor space */
> >>>>>> +		param->reset_type = PSCI_1_1_RESET_TYPE_VENDOR_START | magic[0];
> >>>>>> +		param->cookie = num > 1 ? magic[1] : 0;
> >>>>>> +		param++;
> >>>>>> +		num_psci_reset_params++;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	return 0;
> >>>>>> +}
> >>>>>> +arch_initcall(psci_init_system_reset2_modes);
> >>>>>> +
> >>>>>>  int __init psci_dt_init(void)
> >>>>>>  {
> >>>>>>  	struct device_node *np;
> >>>>>>
> >>>>>> -- 
> >>>>>> 2.34.1
> >>>>>>

-- 
With best wishes
Dmitry

