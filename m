Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70874CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXOaVPd7VhD3hx5c4q+vgR03AqUTjEWUn8n5s3ly05A=; b=JtQwWer3hF6KOjiWmnx8TYjjY/
	pEX+1gU0RTgaPe1ushxWChh/M6tQT7zcQPG7yUKmSU4N+jXHzB4tZ6fev3QWKGM9pKgWPLYDmJPFD
	J6efaT/s8HTfRDX59MecYlkXGjDM46u0TnpMG9ETirA20LTXx37dO/CtSyB050jhMEw3di0qWqUf2
	6xcYBxvGjGfVPYv7zklZOpaPmjWIOGZbygT6wBFyLdTriegyfOTmzbht+zZ7bMCo2wIt+5xepq4Ij
	/MzHq9FwRXOZxV5B7DUdHSc2u0oLzhgr7rTwlwJcernei2ufi0v0V1ZOtxALGdjFomsSaROBLBzJ5
	N0pF7kjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMm8-00000000RZ3-20cD;
	Thu, 15 Oct 2026 14:49:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMm7-00000000RYq-1XxZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:49:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D0106022C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 14:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477061F000C4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 14:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792075782;
	bh=bXOaVPd7VhD3hx5c4q+vgR03AqUTjEWUn8n5s3ly05A=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bncduYwSg2Cj2dMYmqvi2X4zBOLmHttF1YUIbEGCPVxjFplh7Q25LNrK5sOnUHYUA
	 NcoPEos5LbQsw+VzrhXA9S/96v2bxkTLLwlHmZxAVV74haRKcwrH/YZzkM3vq6WjRs
	 0k09NhB/vKBXid0AwP4cDgXOubwpU74/mNVBETIUhkFM07kxWyzvbK8y2ypV2tG7CY
	 3hLChObxcyq6OjHJvl/eOHCN0zFPpycDKJU/yq3QP9QljfkaG/oU5hxbM6ilQ0VKN/
	 GHkG4cqmxhztfBeWom1ZFJ+4A8Qw1RJQBnG6O4K6dfgIazMBh/1pIO/Tz4DTNVEPA9
	 jKAnA8JK2fiog==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso4497046e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 07:49:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxjW1SGNfoOKAaNq11Ow/FS3pa2BdHAFKjdblkxSmpZ10LwTu+epufXVKaBUBO0pmqehoXMzSRgwadKOch1ATSw@lists.infradead.org
X-Gm-Message-State: AFq9FYKnjYY3dvvWcE2wjQtOAyWSjQDcKPH7UqjD6J0VitBZ7xOcQUgk
	q0H6W3TXYpiJbXC1feaUHzHKlAI+mFEzsgs4weKy+hcMGFdXHGrHGsDGn+UNKf1+7xAjRLe0w5M
	ZQ826R5MKLL4oPxJzF1TST6hJcPdVaPtCCMchjkWYdw==
X-Received: by 2002:a05:6512:3e04:b0:5be:3db4:5665 with SMTP id
 2adb3069b0e04-5be3db4582cmr863547e87.7.1792075780254; Thu, 15 Oct 2026
 07:49:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 10:49:37 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 10:49:37 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
MIME-Version: 1.0
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:49:37 -0400
X-Gmail-Original-Message-ID: <CAMRc=MejhYpC6QNXwK_cG_NuJs5XpOviK2NPsEwtnK0RxDi61Q@mail.gmail.com>
X-Gm-Features: AclHuK99R8-us8Fs2p5d0092H4vgTDHcFapELNpNx1Z9qKaqccwjS9iFs8yerts
Message-ID: <CAMRc=MejhYpC6QNXwK_cG_NuJs5XpOviK2NPsEwtnK0RxDi61Q@mail.gmail.com>
Subject: Re: [PATCH v10 00/14] crypto: qce - Fix crypto self-test failures
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Stanimir Varbanov <svarbanov@mm-sol.com>, Eneas U de Queiroz <cotequeiroz@gmail.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Demi Marie Obenour <demiobenour@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 13 Oct 2026 11:57:29 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> This iteration addresses issues raised by sashiko.
>

It came back with some more issues. And seems I have a build failure midway
in the series so that needs fixing too.

Bart

