Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7DDCA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 11:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnwo2QXya9ol8RgKGeByWYeh7ZQyYF+wLDl4brAFLjg=; b=CeVuxFrEJHp86oO7Jyp7Tcd34j
	Cysck/CsaU+M9AU6qRekctUCLnqGK5B5eVpCaF3dGBWvDrqERp352i0aFy/POSGfV/43vgaaXow7H
	DT/o3yd4p3tl11yQPg+BGcNeQ2H2VHHFdcyXreu/3vn/SbgIax4gybFmf/uGCx6ReCn07I6uG5Ql9
	JdFeZMTRhEbgpCfXIdVjFzmHWK6OGRmBk0BQIEY/0lGcrHUfhczsNwQp7xuXWtdmATM3vlSS72chI
	00JS41fM0UFfrZaptRcJQ45s/spwqqCJ/ERaJwfkEK14SrPpOA65aLiPIcH1xkB043dIV8Sho1/gQ
	dc4LxmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmAW-00000004Du8-3I1g;
	Thu, 08 Oct 2026 11:20:12 +0000
Received: from out-251.mta1.migadu.com ([2001:41d0:203:375::fb] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEmAU-00000004Dt7-0kIq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 11:20:11 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=nnwo2QXya9ol8RgKGeByWYeh7ZQyYF+wLDl4brAFLjg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791458408; v=1; x=1792063208;
 b=OhgjK8h9nDlLL/Vn8Xv+q0ZhAcJUWmg53JL+fJvKAo07flH6HcIL4cLBMyLeFvGeFloCry3u
 yEH+pAsrNyJT+7tAyNmI0o8LlijV4ur4dpRnn1MDYZnvgai8hPL93lV00k9XCZtRwsvTMydd6wZ
 QT5IokeL9++9ePn8449q1IsQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7eaef28c1ed8ab2f;
	Thu, 08 Oct 2026 11:20:07 +0000
X-Mizu-Trace-ID: 7eaef28c1ed8ab2f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba40832934so5757e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 04:20:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxYAJXBIW2QcUugCY4qrymskpVkvibZTQAsh0XaLzGhj2c9mkjzAn58v/740zd33R0HEyQ/d+Q7r3QAtpjyi4YP@lists.infradead.org
X-Gm-Message-State: AFq9FYIV4PdWbDPju3qaA7tst5CxV8Pve7S4iUVRQYUiunfSpEcyb5n7
	TjsTsNe7CsoT2nbn6jNdrICYPn15Xj1xkzmTzyhw3f8sGhicRWIOJCyilfAB8W1oPuhh1sQzlmJ
	FoChLhLwndaUu3LcygLfHsA1HkVYqUq3hBn1SkMWb
X-Received: by 2002:a05:6512:3d8a:b0:5ba:3797:2359 with SMTP id
 2adb3069b0e04-5bcd3d9881cmr122128e87.2.1791458402506; Thu, 08 Oct 2026
 04:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com> <20261007150255.1648849-3-vdonnefort@google.com>
In-Reply-To: <20261007150255.1648849-3-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 13:19:25 +0200
X-Gmail-Original-Message-ID: <CA+EHjTz3kBt+XXS-MS_=nkgTQW2dXq9N7aQaeiJMmwg6aSebjA@mail.gmail.com>
X-Gm-Features: AclHuK-2zoYWYiRP6KLr34LKbmiuJrlwhSwx-VfiG1DkwM_aMfNpTkUp_Nx-VSc
Message-ID: <CA+EHjTz3kBt+XXS-MS_=nkgTQW2dXq9N7aQaeiJMmwg6aSebjA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drivers/virt: pkvm: Make pkvm_granule __ro_after_init
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_042010_360077_A0F4D076 
X-CRM114-Status: UNSURE (   6.82  )
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

Hi Vincent,

On Wed, 07 Oct 2026 16:02:52 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:
> pkvm_granule is only written once during init in
> pkvm_init_hyp_services(). Mark it as __ro_after_init.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

