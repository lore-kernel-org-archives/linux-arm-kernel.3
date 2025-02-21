Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12255C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukdJbDhKo1dMezEJpSBDnVqcBujgHnmMUHPeyWB0hOg=; b=VS4vS+nMIA39vHOW1D+sBiKZXJ
	f4kX4qagfcraZNjzzdyQK7RzHyWAZn1rPJXGZ3DNsa7c1/EFlPXj1301XK8cz2Do0YaBli+xltNAV
	sNFRLyfmvP7/WfMIJBnZ4yjDPySgM+qt/3rjgkbnWSDlyNe12IjlRtd+PtTHBW+abk5nfc8zF8aaM
	PR1szikccXd+9rxeqpMslL1avm44xzLr9s7MSG7E3c/YciEhJOUNUj/Jk+Y+HCIFRUU9i417lKWc/
	T7Ywaick1+nOByt6UrneMv95GXYPj2012qDkqtHCFnANwxlkEzAPNGWVAXzojZk+ZjxWV0+5OYJL7
	OKimIzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWY0-00000006KCt-2KqD;
	Fri, 21 Feb 2025 17:10:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWTI-00000006Iuv-3swQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 17:05:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAF955C6BA4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 17:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809BEC4CEEA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740157551;
	bh=jSby6rnqKjliEMlrxy3uDKVy/l12aoQ+Uo0UrPP40Lk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mH40HEwTHjeM9NIpgOxjL1qMY7pdYQ+4m/N8gfR36FGqUOJSlxHZRUrUFtUNlCHeY
	 y1q5VTos3TTxyvhmGBd/I6KG/Qw5FsqvLb9aqd/jEaaGUNaiN+v53BLGBziZf41XIY
	 Jn8yFesjGGQLx301ywkDLAeE/CxpnEi6sCYyPTeCUsiT6NRB4UosQH9tEXwtSYwuSV
	 qk14DooIeQCm1U10v+SFBxEExW4vM4xEUhgW7mx2RO2nog27cpEi8diecsKpAGtiz7
	 0pivjoWncSbm9UxIzu2skfabPmQY0v4m4HG/JRpgYGxbUoen0NTwk9c3wMmLtyo4bS
	 oxN0PJHae2Ydg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so4428310a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 09:05:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvjOvnsUCJznV1I3+9BYPrRjemCqofBA96/sVQu/1Z52tq2EkUn7rE4SqMCQfcRKPZbnhPp+ucMSJmznzNBDw+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/6u5DUXi3S6P8w0T1acyaixS+K4wOTePKdHYkHq50NFsz4RJc
	S+cJZcz06FQDkvnd+/Pc4KVzS/31DAgZf2i2EZJS91mAdMMtuY39UQTre8rF0YsmKJWqVU2yQLl
	H4+AyPQccN2WWN0u5j/8J1dot7w==
X-Google-Smtp-Source: AGHT+IEHxK5Q0XUfTPtZAuMZkAwRWMw8XfiydzGFLhctNfa4yiIzH0cTCubtuN3R8RmjkWGuvnxxNAal/4l8vQ8oXyY=
X-Received: by 2002:a05:6402:3513:b0:5de:39fd:b2ff with SMTP id
 4fb4d7f45d1cf-5e0b6feec0amr3935821a12.0.1740157549868; Fri, 21 Feb 2025
 09:05:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704728353.git.michal.simek@amd.com> <18339ffa3d8c3bf284d9c53ce950beea76516408.1704728353.git.michal.simek@amd.com>
In-Reply-To: <18339ffa3d8c3bf284d9c53ce950beea76516408.1704728353.git.michal.simek@amd.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 21 Feb 2025 11:05:37 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+z-q3fJUdXeSz3mO34=nPYJ+Atc0tvpFswZc3j_rZNdg@mail.gmail.com>
X-Gm-Features: AWEUYZn8Prd84CYTiqgtyxCxmUOA14ATU8QMJIUIGFlCopSWEzeQLWfyxKnLtX4
Message-ID: <CAL_Jsq+z-q3fJUdXeSz3mO34=nPYJ+Atc0tvpFswZc3j_rZNdg@mail.gmail.com>
Subject: Re: [PATCH 01/14] arm64: xilinx: Move address/size-cells to proper locations
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com, 
	git@xilinx.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_090553_051003_A9259976 
X-CRM114-Status: GOOD (  11.72  )
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

On Mon, Jan 8, 2024 at 9:39=E2=80=AFAM Michal Simek <michal.simek@amd.com> =
wrote:
>
> Move cells to board dtsi files from generic zynqmp.dtsi. Changes are
> related to qspi, spi, nand, i2c and ethernet
> address cells
>
>  make -j8 W=3D1 dtbs

I don't think this is an improvement. The warnings are guidance, not 100% r=
ule.

>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
>
>  arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dts  |  6 ++++++
>  arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dts  |  2 ++
>  arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dts  |  2 ++
>  .../boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts    |  4 ++++
>  .../boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dts    |  8 ++++++++
>  .../boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dts    |  2 ++
>  .../boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dts    |  2 ++
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts  |  2 ++
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts  |  6 ++++++
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts  |  4 ++++
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts  |  4 ++++
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts  |  6 ++++++
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts  |  6 ++++++
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dts |  2 ++
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi             | 14 --------------
>  15 files changed, 56 insertions(+), 14 deletions(-)

