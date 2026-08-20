Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF24DC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:To:From:References:Cc:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ne8UKQqykdUM1FqeQsf/i5+3ZCLGHZmKICQgnDK8mmA=; b=YA5E7bel5fdD720qGcC4A1Czqu
	Vf8AiN/ur3wBxnt5xS8Eioo25jFpy0pXVM+Ww06fQ4ISEiF+U5dfUVFKQRVrs7vXCpgMYYsXrlMDb
	AYB/c/WdnbA8vSFtgYPEoLVdkf3esPkNlZxDJlntWzBeQ0jV49aYIOKCReBIFsZMipnjujYlTjFOn
	tRiaUXRpqqFk3MeS75DY0F/9g3XOvxOo9vVwL1fINliXbk0zmudK2ylvAeBUh5M52+ASU6IwszGPg
	fIxVKyDfxLHH4qd/ghefIJfjI/XrJZcftNH/taYEp2S5JzEay1kMLAns0lL29ChegZr/YjiudlNJG
	t7lwKSNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3ZB-0000000BgSs-1vuX;
	Thu, 20 Aug 2026 14:16:25 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Z8-0000000BgSZ-2bxr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 14:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787235369; x=1787840169; i=markus.elfring@web.de;
	bh=ne8UKQqykdUM1FqeQsf/i5+3ZCLGHZmKICQgnDK8mmA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:Cc:
	 References:From:To:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=H4j/HHoQTnV4o7M12B6f9evilkEa5ycGShW7iQyaFTpG86HJ47VETRSCG7hiVcWB
	 8ilN91sDGQZ/4pKznnVgYq7nr1Djc5bblhFCUgJTKmnb6Si0nIs7Y+9X0pDvJWZtC
	 webGTV29tZMyMoebhVsdjiCZISUOKOEoJRt9xwslHi1yZHl/j3phGWZAJKJdKWEx+
	 vi61AdEM3UczWD1An3DFtiTUUAL1DrbtayZ+EnQc9655AyWo24fW8SK7r4lJvWCti
	 dJz8RlFaibX4wWpiGVYgVe/agMSwXvtp+CzqekDd9/C5AWi29GyIiQAWnf9n5CZDl
	 iHORUh2dr2OCY5v2cA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N6bD0-1wtSEx11na-00xGRV; Thu, 20
 Aug 2026 16:16:09 +0200
Message-ID: <87126df0-d332-48e7-b128-a96d6a8330d8@web.de>
Date: Thu, 20 Aug 2026 16:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf/dwc_pcie: Fix PCI device reference leak in probe
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20260820135611.3901886-1-ruoyuw560@gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
To: Ruoyu Wang <ruoyuw560@gmail.com>, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jing Zhang
 <renyu.zj@linux.alibaba.com>, Mark Rutland <mark.rutland@arm.com>,
 Shuai Xue <xueshuai@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Yunhui Cui <cuiyunhui@bytedance.com>
In-Reply-To: <20260820135611.3901886-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WqrjtmnDMXHmqRVTnqnOARnLZSrj9moSoeImG4ffQI+orAo0ZXa
 WGFFO30WLe6pZGiD/2A+pz9cXnuG/pilogiqGA8GQhq0duAktC0nR2Wb5nDScd+XGVB4a8u
 +xfJUhj0MBAmT9eq454QszTpuNtN9DyL76l1WqxiDvP7YW9rv/U+NiO5jEU5Lsu0LkJ0e41
 vN7VXgv6eH1s6TX6bel4w==
UI-OutboundReport: notjunk:1;M01:P0:XMke1zJ7Y2I=;x2UZ2ahTexPe+Tt1yOB35Y4Xkmi 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 FV9qF4/A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_071623_029336_66BCA03C 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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

=E2=80=A6
> Declare the looked-up device with __free(pci_dev_put), so the temporary
> reference is released on every return path. Keeping the reference scoped
> to the whole probe also covers all later uses of the device during
> initialization.
=E2=80=A6

Is there a need to reduce the scope for such a local variable further
by using a corresponding compound statement?

Regards,
Markus

