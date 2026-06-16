Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA555CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 08:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0fLaFQ950eBptOVg8md2eixmDLx1TIa5yy+9sn5UnI=; b=C8oQQFy2HKxgGsLGy9PF+l+wXF
	eiz6AKd5WhOBuvfcWLimXrzJmc9EfRTVXdo57+iWLeIHdPIGytmZ/hyQS0kn9W9uIPc6D5EBbcEEs
	G3bFmYxtZix1voa2v1uS3rp9wkEIKZKSm9K4ad+ozKiPOYSW/ZbyN5FbvPDJQO3WJLpVnAYGJl2aC
	xdBcTN8EFxY7FaoDU6cG4edFLcxDKOs57XKgPNw+2Ek6REr6FQpA6TS8Y8hIgA8FO4PPDCZBouvg4
	Dnxd8Q+HbhGjScFUtucl5SHM6NTGQ5nAaiti7ILqn7kvqFvjppsqa+PgKPqpB36w7XmJXm80+Tmw0
	FG34kOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZP8v-0000000FRur-2cVs;
	Tue, 16 Jun 2026 08:27:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZP8u-0000000FRua-2imm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 08:27:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C8CC42BAC;
	Tue, 16 Jun 2026 08:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30781F000E9;
	Tue, 16 Jun 2026 08:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781598452;
	bh=Q0fLaFQ950eBptOVg8md2eixmDLx1TIa5yy+9sn5UnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uo0jo+1XthHZVO2hdLrC0mDJGqQqRvUVfi5P8TKbPbggYu92RYZGF270mBt2damKG
	 fYpKdCUQDLPeW8jfZrn39XtOZTuuoiTJiTIY6cb1UFquKj26esMnjxENMI7AcviBmi
	 gEtac6MDfV048DQLSM65MTyRvmhfjkVcMddqm/WQ5v5hWHsW1HXtY5u9bWg6kn9nJk
	 oSQCt8WHPSn5gu2VkLuKYjVwloWEkEaKPDmzrMQIRECcK8NNVp1C1rLYoY+mQ51LhP
	 m8dAMVkVtvxcoa1vPBC7o6Mv0fGDQOJkLHsaqSAcovFRy0X+yipacJIlJzz0GNI8m8
	 zUb1VMOLk2ZHA==
Date: Tue, 16 Jun 2026 09:27:25 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Amir Vajid <amir.vajid@oss.qualcomm.com>,
	Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
Subject: Re: [PATCH RFC v7 0/9] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
Message-ID: <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
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

On Wed, Jun 10, 2026 at 02:21:27PM +0530, Pragnesh Papaniya wrote:
> The QCOM SCMI vendor protocol provides a generic way of exposing a number of
> Qualcomm SoC specific features (like memory bus scaling) through a mixture of
> pre-determined algorithm strings and param_id pairs hosted on the SCMI
> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
> mechanism to control the various caches and RAM is hosted on the CPU Control
> Processor (CPUCP) and the method to tweak and start the governor is exposed
> through the QCOM SCMI Generic Extension Protocol.
> 
> This series introduces the devfreq SCMI client driver that uses the MEMLAT
> algorithm string hosted on the QCOM SCMI Generic Extension Protocol to detect
> memory latency workloads and control frequency/level of the various memory
> buses (DDR/LLCC/DDR_QOS). DDR/LLCC/DDR_QOS are modelled as devfreq devices
> using the remote devfreq governor. This provides basic insight into device
> operation via trans_stat and lets userspace further tweak the parameters of
> the remote governor.
> 
> trans_stat data for DDR/LLCC/DDR_QOS is now available with this series:
> 
>      From  :   To
>    315000000 479000000 545000000 725000000 840000000  959000000 1090000000 1211000000   time(ms)
>    315000000:         0         3         6         6         6         7         0        30    143956
>    479000000:         2         0         7         1         1         1         0         3       356
>    545000000:         7         6         0         5         5         0         0        10      1200
>    725000000:         3         0         5         0         6         1         0         6      2172
>    840000000:         8         2         3         2         0         4         0        12      1188
>    959000000:         3         0         1         2         2         0         0        13       272
>   1090000000:         0         0         0         0         0         0         0         0         0
>   1211000000:        35         4        11         5        11         8         0         0     21684
> Total transition : 253
> 
> QCOM SCMI Generic Vendor protocol background:
> A lot of the vendor protocol numbers used internally were for
> debug/internal development purposes that were either highly SoC-specific
> or had to be disabled because some features were fused out during
> production. This led to a large number of vendor protocol numbers being
> quickly consumed and never released. Using a single generic vendor
> protocol with functionality abstracted behind algorithm strings gives us
> the flexibility of letting such functionality exist during initial
> development/debugging while still being able to expose mature features
> (like MEMLAT) once they have stabilised. The param_ids are expected to
> act as ABI for algorithm strings like MEMLAT.
> 

Not sure if it was discussed in the previous versions or not, it would be
good if you can capture why some of bus scaling doesn't work with the existing
SCMI performance protocol and the monitors don't fit the MPAM mode.

Please capture them in 1/9 as a motivation for this vendor protocol. It will
then help to understand it better as I am still struggling to. Sorry for that.

-- 
Regards,
Sudeep

