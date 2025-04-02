Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BB7C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 18:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLRltPAW2VT+osyndq8xbNTAaaTzvicU6XEHnaTvyEQ=; b=HbR+yRZF+sYTxp98/kPpUV+oMQ
	RZUNkFdxOJJJuYjlPlXJjpezsA3kSG8253lA53el4SI8SA8PcNXWw1YyDbfIlD85riLw3wZgFh/d1
	imwr3Kn0LtU3Jxqin6cEnJQjTIxL7ASAHhYiC4W52nI6EPpi7KldfXEHltI5MD9YsTRT193Wh9xHK
	o6cWzuztNHmHdFMjucyw/JELAXSSwg76x7VSPZR5iQXnXTHxXsOqcLvIN5JgsXOaNj1mcNy2Gxx5F
	foOBUSlcZiJWjXSMD7EfRQRH8Fkta4uwvElBm9g41RUOUtTU1CVorWUHIPoyg7LBPQsttOrOiH+PZ
	TuVcFQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u031k-00000006wsj-0Hh9;
	Wed, 02 Apr 2025 18:41:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02zq-00000006wWE-0y0n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 18:39:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532Cs4EC012992
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Apr 2025 18:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLRltPAW2VT+osyndq8xbNTAaaTzvicU6XEHnaTvyEQ=; b=ESY+6x7scCrYx+nG
	BrnUXYp5lICXjecsq2AXoO/uQpGAP95loBcQcLxRTeLSEwb2eidswYei2oMEoyc5
	aoP4uSPj80Df2j0dk3523XVXObrAM93Z6SXWy620jysZlLFSd3FZCd2+qQxXf/D3
	DWkGujXDcuc6+i9wt2WXm21X2NHrL+l12ECJqSNiOp/rWmtXLCZOyldDsOX/QxVc
	wk8NJbM0ZOGS9IfoSh+8pnnA42eLn42rAhN0A+fpDwgAsQtThrrGbucwVb6nSKZl
	/8NGadeGi4anVSQRK9IB5TkEoOEncnCdTqZufa2lHJ6sfkJfH6mhJ+nSkQHypFm8
	42xKiA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxbf2acn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 18:39:27 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3fdf9b1f191so141956b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 11:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743619166; x=1744223966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLRltPAW2VT+osyndq8xbNTAaaTzvicU6XEHnaTvyEQ=;
        b=eP1TOE5e8pGpbP3KNqVcjOaxnO4k5/eNfWqzm5VIuIQkIUyFdVwHfGVh56AHpwB9jJ
         7rr5L4XbqgpqXI0nEr6QsH+/z1x8rKCQOBy34QCGXCw8/etMxMOlSIiDWElY4Fj5fxuG
         0Izsto6DKlZdXuLjNzKGCBT10+Hhfml8HzfEMFwTP6R96XzWqHJTaHismHuL6IzDK2gy
         YX3l59zEmeGURWWQda0V/MIGDRUTPhLfifhWKvlb3yNYXfTSjNeHPegqes7iIg5/n6g/
         LNp2JHktQsuTvOnvqz07ModNrnNxOdA/ze3uVU4XKNlx0Xymm0rXZpjhtSFmGK5jSYSD
         aKkg==
X-Forwarded-Encrypted: i=1; AJvYcCUiQzMtKo7WJo9n6Rx+L68Lv1RZtqbWcnZDZtz6RhdGgCFe2x2aP1EixI4wv2YdfJZU4W+ynH48bQk6frbeHY6a@lists.infradead.org
X-Gm-Message-State: AOJu0YwvuGmEQjuWfrBUFEme+BPVn79XeUoNk6SWeokOl18azLAgq1/y
	W19WsdqjYEk6Kl5DWPEJ55dNH1DKhd6ZtD8nFNHlgzlbUvvFWKmyAOMROqqY7HaE7Qi2T+tLwbQ
	82v0mGDgMKXMhz2V6L43oNu60a0Q+F3wH9YnHCTG4Gwxs1m8uj2L0Q5eRZVHoIPq+ESRJPA2UlG
	J8hSqsvnF4fXmuw+fAR11Q64ac4TXQy44IXHtMC777oGN9c/GVvREAj4wW
X-Gm-Gg: ASbGncuyI4V40XRP7drIhKEvk/xwOEk54ayuCpv4Szhjeskm6N/7gVFbfXEefV4vOE/
	pehNsJYzc03FKKNwMHOizYIwQv3W9xPipqmEWgc8mrk/n6RMVTjWqXNcGAjA/6Ld/hQgeBxpRSQ
	==
X-Received: by 2002:a05:6808:6c82:b0:3fb:2e8f:4de5 with SMTP id 5614622812f47-3ff0f52ef55mr12164462b6e.17.1743619166134;
        Wed, 02 Apr 2025 11:39:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa8ubrSd45uaaFhCFxG8RPmNf74FF0t82olgtZy7cR4JA2o8Zjllf8U6MoEnTSrTKOqq9YmFW/PnuOLXRUna8=
X-Received: by 2002:a05:6808:6c82:b0:3fb:2e8f:4de5 with SMTP id
 5614622812f47-3ff0f52ef55mr12164445b6e.17.1743619165788; Wed, 02 Apr 2025
 11:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250303-arm-psci-system_reset2-vendor-reboots-v9-0-b2cf4a20feda@oss.qualcomm.com>
 <20250303-arm-psci-system_reset2-vendor-reboots-v9-2-b2cf4a20feda@oss.qualcomm.com>
 <Z9QQw6BcE7IXzu+r@lpieralisi> <Z+K3uNjTNbq3pUis@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <Z+K3uNjTNbq3pUis@hu-mojha-hyd.qualcomm.com>
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Thu, 3 Apr 2025 00:09:14 +0530
X-Gm-Features: AQ5f1JoIGcawwwxAneye4VDKyUquub00SsUJlDPk9-P3wh_983NTysTlWsL0c0s
Message-ID: <CAN3W6UUgacP0JZc7yGJ2Q3HYGFZ3mMHh0okyHTMiuxDSwmABHA@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] firmware: psci: Read and use vendor reset types
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Shivendra Pratap <quic_spratap@quicinc.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Elliot Berman <elliotb317@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: YUwh__sP9O800yFol-V5UsLdyyfrR2lw
X-Proofpoint-ORIG-GUID: YUwh__sP9O800yFol-V5UsLdyyfrR2lw
X-Authority-Analysis: v=2.4 cv=F/5XdrhN c=1 sm=1 tr=0 ts=67ed845f cx=c_pps a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=GcyzOjIWAAAA:8 a=EUspDBNiAAAA:8 a=ZS3UFk-b-OyYpVL8qdMA:9 a=QEXdDO2ut3YA:10 a=dtxw0mqMjrQA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=hQL3dl6oAZ8NdCsdz28n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_08,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_113930_404543_5C4DB726 
X-CRM114-Status: GOOD (  45.49  )
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

On Tue, Mar 25, 2025 at 7:33=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> On Fri, Mar 14, 2025 at 12:19:31PM +0100, Lorenzo Pieralisi wrote:
> > On Mon, Mar 03, 2025 at 01:08:31PM -0800, Elliot Berman wrote:
> > > From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> > >
> > > SoC vendors have different types of resets and are controlled through
> > > various registers. For instance, Qualcomm chipsets can reboot to a
> > > "download mode" that allows a RAM dump to be collected. Another examp=
le
> > > is they also support writing a cookie that can be read by bootloader
> > > during next boot. PSCI offers a mechanism, SYSTEM_RESET2, for these
> > > vendor reset types to be implemented without requiring drivers for ev=
ery
> > > register/cookie.
> > >
> > > Add support in PSCI to statically map reboot mode commands from
> > > userspace to a vendor reset and cookie value using the device tree.
> >
> > I have managed to discuss a little bit this patchset over the last
> > few days and I think we have defined a plan going forward.
> >
> > A point that was raised is:
> >
> > https://man7.org/linux/man-pages/man2/reboot.2.html
> >
> > LINUX_REBOOT_CMD_RESTART2 *arg command, what is it supposed to
> > represent ?
> >
> > Is it the mode the system should reboot into OR it is the
> > actual command to be issued (which is what this patchset
> > implements) ?
> >
> > LINUX_REBOOT_CMD_RESTART "..a default restart..."
> >
> > It is unclear what "default" means. We wonder whether the
> > reboot_mode variable was introduced to _define_ that "default".
> >
> > So, in short, my aim is trying to decouple reboot_mode from the
> > LINUX_REBOOT_CMD_RESTART2 *arg command.
> >
> > I believe that adding a sysfs interface to reboot-mode driver
> > infrastructure would be useful, so that the commands would
> > be exposed to userspace and userspace can set the *arg command
> > specifically to issue a given reset/mode.
> >
> > I wonder why this is not already in place for eg syscon-reboot-mode
> > resets, how does user space issue a command in those systems if the
> > available commands aren't exposed to userspace ?
> >
> > Is there a kernel entity exposing those "modes" to userspace, somehow ?
> >
> > > A separate initcall is needed to parse the devicetree, instead of usi=
ng
> > > psci_dt_init because mm isn't sufficiently set up to allocate memory.
> > >
> > > Reboot mode framework is close but doesn't quite fit with the
> > > design and requirements for PSCI SYSTEM_RESET2. Some of these issues =
can
> > > be solved but doesn't seem reasonable in sum:
> > >  1. reboot mode registers against the reboot_notifier_list, which is =
too
> > >     early to call SYSTEM_RESET2. PSCI would need to remember the rese=
t
> > >     type from the reboot-mode framework callback and use it
> > >     psci_sys_reset.
> > >  2. reboot mode assumes only one cookie/parameter is described in the
> > >     device tree. SYSTEM_RESET2 uses 2: one for the type and one for
> > >     cookie.
> >
> > This can be changed and I think it should, so that the reboot modes
> > are exposed to user space and PSCI can use that.
> >
> In the case of a regular reboot or panic, the reboot/panic notifiers run
> first, followed by the restart notifiers. The PSCI reset/reset2 should
> be the last call from Linux, and ideally, this call should not fail.
>
> Reboot mode notifiers =3D> restart notifiers or Panic notifiers =3D> rest=
art
> notifiers
>
> So, if I understand correctly, you mean that we can change the reboot
> mode framework to expose the arguments available to user space. We can
> extend it to accept magic and cookies, save them in the reboot
> framework, and retrieve them via a call from PSCI during a regular
> reboot or panic based on the current arguments. Is this leading towards
> writing an ARM-specific PSCI-reboot-mode driver, which in its reboot
> notifier callback saves the magic and cookies, and these magic and
> cookies will be used during psci_sys_reset2()? Or is there something
> wrong with my understanding?

In case this mail got lost in your inbox, I wanted to float this up
again as this is a very important ARM feature and
its future course of action depends on the common understanding.

-Mukesh

