Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B607CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgL/n87wUIynRIBk3hVwoxTR3GOoA+TrpsX5Ikeksvg=; b=1gMV6EbkFtCVXoo4XtSFq/Rc0I
	Nxlwdw8igbsGmBX/SCustXEV+Iy6tWpMfLk8sejLItzMnYT18JMtxwF8UsVCju3a1392emVqv52/U
	bPsOZaBkfTCNLHDChfDjbdzHIXKSCX0aISmWlVRU2OIZ5+8eaF7vL3QQLqu5pQORCxBrdRfUU7lq5
	r0UjS44yuSZzVhERxXVxW81apWFP1KI3bdaCnfwWOBCxdTbzZIldpwC8hzvJLe4Y43r1zGFUvGRzr
	skYvRuxarJiUE3j7mkNCJ9DejhUqPbQN/KwJqCO5ibpmpBbB5L4YUvjeX+lF+Ric5AQn/J4C4XdI8
	uZJkoUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFWw-00000008pLX-3jz4;
	Thu, 01 Oct 2026 12:04:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFTL-00000008iQN-0XSp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:01:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9366C4126C;
	Thu,  1 Oct 2026 12:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE901F00898;
	Thu,  1 Oct 2026 12:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856070;
	bh=HgL/n87wUIynRIBk3hVwoxTR3GOoA+TrpsX5Ikeksvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fAgCFphv5Sno6BFZGsyTHXNBEB+eEqzkISa1m4UJbBycGe6F8kIriqtcbA/m3xo2l
	 SrrCuXT2VYNtC7xP9AD4SZGlq3C7UWD1F59oDTRceyE6mxdogAQzgiFMabsfG7CWVh
	 q5rJjdoAkZ4E/2upHbNb3wsmcZ8Zp1v+VjmQq5qxQaryS0+1S8sMyvFXoCtTSk+aG6
	 BYKD0jYkCnXsj8FANeW6SLCZ8HEQOwd+qfVXHIRHwrStF+DSGZH6zcvCtaj7Ge7MPg
	 r1n79dpw4AXbS5xzu4Mx/RxpNQKqUtgOsu/yHJran6Hitxr65LM4p3s0TY2NyedlRQ
	 Il3BRLEwtnIGA==
Date: Thu, 1 Oct 2026 14:01:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Ben Dooks <ben.dooks@codethink.co.uk>, Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Wangao Wang <wangao.wang@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Dan Carpenter <error27@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>, 
	Gourav Kumar <gouravk@qti.qualcomm.com>, Hongyan Xu <getshell@seu.edu.cn>, 
	Jason Pettit <jason.pettit@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Linmao Li <lilinmao@kylinos.cn>, 
	Luca Weiss <luca.weiss@fairphone.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Pan Chuang <panchuang@vivo.com>, Sreeshankar K <sreeshankar0910@gmail.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, bui duc phuc <phucduc.bui@gmail.com>
Subject: Re: [GIT PULL] Qualcomm driver updates for v7.4
Message-ID: <20261001-stalwart-winged-curassow-6ff14c@quoll>
References: <20260923025246.407729-1-andersson@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260923025246.407729-1-andersson@kernel.org>
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

On Tue, Sep 22, 2026 at 09:52:46PM -0500, Bjorn Andersson wrote:
>=20
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b9=
35:
>=20
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-drivers-for-7.4
>=20
> for you to fetch changes up to d3bacfccd82c974a541398a5ce310de7546b525f:
>=20
>   firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA) (2026=
-09-16 17:07:24 -0500)
>=20
> ----------------------------------------------------------------

Fails to build:

drivers/soc/qcom/socinfo.c:25:27: error: =E2=80=98QCOM_ID_SM7250=E2=80=99 u=
ndeclared here (not in a function); did you mean =E2=80=98QCOM_ID_SM7750=E2=
=80=99?


Best regards,
Krzysztof


