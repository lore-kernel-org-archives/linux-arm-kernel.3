Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EC9CA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 01:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kw6qrZh0BRJNUFEBhohBLxpf0Jd2f9++I/pRK2fslF8=; b=teohQmuy9h4WS0GPBBavjgHrVO
	GGBDxTPObVI5CMvA8HTl0OQ2VxTfXXUi55ctqL5b8R9sl/QDsGqc94rsj/xRmqAK0+2rvDqPCzoTx
	mwnsLXDfh0lEMeIGF9t/PuicK9HqfCuld0IppJMFw0qRdsxKoXUUANzAqIBq66HWRFnYYj+l+ai08
	tpjSfh6OvjsEp2cS3TDmXXJL0yrBkZBEGUcmXBaRHtuP27EZvXG0dpe9NI5pW3v4ZCNz0/GnNNCht
	D2cBkR0dH5TXbN5YwW0cgRfHgZa4YKR2rDHMU5pm4pfPsV3sNOVplPshxBmEMG0oALxlp7dlnQE4S
	E4wxhwVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4ra-00000009YCg-35C4;
	Mon, 12 Oct 2026 01:30:02 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4rX-00000009YBu-11Iv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 01:30:00 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-486f013db83so241742fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 18:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768598; cv=none;
        d=google.com; s=arc-20260327;
        b=W2ZTKOwAZ45yTtdAQITAUHyjALg5qaw1oRpw56aRbkxal9qRzPhyx0am8B9FPm6mv+
         05oDhRwiksIzd9AfF1Uk4/onQVDp0ADdPimbkumCLgx5rYgfH6m664C86U0bSW/ybyLO
         IX278AMmpgcG4GnQ5nGIpKcl1fV0lauDRRK176x5dclAsY2H83J7GmEAYdOhyiRc3s9A
         Sc+g2fjT8zSQR41VMc8dRScvZK9vAdkazDmXT4jPgMdp13xd7cJvnxHTyyb+wYGLnKsS
         DvTuZpolmPml41chm9VrOOoLV/I6RvVhCNmOgpvifT2M5ASMkMnpgOHqF5EtbVZxVa9z
         tXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kw6qrZh0BRJNUFEBhohBLxpf0Jd2f9++I/pRK2fslF8=;
        fh=P8pa+b/86fjEOeGj8Tuhm5cSPq+sDQqhMonMLJiTMas=;
        b=CTndqzV35oHkxdUDXDRpZg7eu2zgEyihDGFFSP9j6ZXSOP1oTODURCXkMo9aezRRcq
         F8iFSIYRa5qJB2WMwSrukFtXjpyayLLKdpPJiDR2TQUVxyQsNphZ8pE9u4jhUWmmr7lH
         cOFyzm9N4TYZz+ataVJl7aEWjyjX9rmwQzvCXclQVTaB4g7E2eOg0Crary9ikG44Pj5P
         8ruSFQhOPSz09OiCWPnJpsreFw9//1CDrW3up7OOIO7iBI7INFPpzZYKzL6eCqZMfuHJ
         0Zb+dlsi2vKxFTd6ARADs0PW3ag5YtIm8lu/jL3u3IyWeaQ55p0xTe9WQbZIZBxCyu57
         hXSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768598; x=1792373398; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kw6qrZh0BRJNUFEBhohBLxpf0Jd2f9++I/pRK2fslF8=;
        b=rvN5PPcjvjVjcjhZT8WtkbSoKnKPt6h3+8jYOXIeH70yZ15gh0gMQIA1hYdL53atpo
         qOzRKiXuR+04x/xBSSZxVuGJ62nnfVmBwIECAMy32QxFGVgERm419LtuugK7tzu9UmOO
         nwgp0mwz5L7nKZ42AX2654USz5LziEVNK5ChFdoV+4eO8IxgEkA1uzzRMYK42ktncTcn
         y5QI4TgtzE0Bg+MGYJSQ155oBmnQ2KsbmWo7+SBzwlMiXKLTLAkl0fvBNmlVe3a8TS0I
         fPVMgxetSjdZ+O5A6B2NJjGNLhY7EDVz5dkrwrK07K8EIstojh0OXfzsjQP4d4W0tI5q
         1lOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768598; x=1792373398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kw6qrZh0BRJNUFEBhohBLxpf0Jd2f9++I/pRK2fslF8=;
        b=DnBu69zVSlCI0q5G09f3s4sWLi/DhSOx5Lwh/vFGPJyCh9VX4njNhQMi6jNZwXEDxf
         Y9YWI8G0s4PoRLuxR61VZ8ONe5ydPneED8Pha3CKBSHHLL37jLcn6GzCrjKVOblKxxDy
         c/jQBt1j6xt/UHRtSWSjIbArHMp33zBNXrdtwC0/aQp4R4om8kySEtLGr/9L/+NIiBq9
         3XGhCxRls5e93yCLiOnfUkibPRWwREqgvcG/9Ur2V4gNjY+8ngmb2Wb9G2VCFw6STuWI
         Cej5uTBYzX16wNvVnkV5g1RnO8vUwRJ8e0YAayaNkvzk+r/H1J7wBwTz3V9A+MJXiW49
         kWEg==
X-Forwarded-Encrypted: i=1; AKwUvBwDBTSiMm/WY+BG93uGgN+FBhJW13ND2YyOBcZSQ8+EvZlf2uiahCdCgzXgzdUcEVJZjZ0TLyRei90v+o/SuoP+@lists.infradead.org
X-Gm-Message-State: AFq9FYKkdBpHiBUKuO4wjRPUSyF5dsqBBx4iHJ0L0l9zcvzn6wO2tjN2
	NS/ppuw76F8UxxprZ//9PJb84OMlwFeE3VzWdMpMz38HdSa+azttNILBvbJor7v3RUh+ZGNlgOT
	wPm3eCkxnIj49GBay/AYBJOiMMCCFSZrGJhDp
X-Gm-Gg: AYBFou0CQ6sSuasO6bbn0tJreg0DcwfX36VulcJzny+iCCgHy8/1pCFeVJzS8AOehM5
	HYy16g5Aq4P6JUDWPvmHqTl16uWof6cv2XGRrC6qR4sFmKP97t8szhtK1mArqFSIbLMy1iNRk0z
	ePwkgqgz1xVqI9VIp9sZj82fdSi2CXYvUd3z5OwniJ2NWpZsqnlOD1iJFWgrJ4diaRU3oeBMwZl
	XELhxYPCDPNzXtJuPH5vNu6pI5dp2xuVfyZIN0m3RSajRse/GMsY8Ufg/+S1Ds7KwSZsT0aGo7V
	DDJgiWPhbUs9y4XMLckfYDwN0Gq85SK4uelF5pikzElVEmXy4yzZ6tg=
X-Received: by 2002:a05:6871:e0f5:b0:493:186e:c57 with SMTP id
 586e51a60fabf-4a2a850b384mr6586764fac.2.1791768598035; Sun, 11 Oct 2026
 18:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260903-axiado-mailbox-fixes-v1-v1-0-f44cba251254@axiado.com>
In-Reply-To: <20260903-axiado-mailbox-fixes-v1-v1-0-f44cba251254@axiado.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:29:45 -0500
X-Gm-Features: AclHuK_lsvSSZO0Bi2pRxQKVVy1uDraC5Xay_eyyK_NjHGjAgdxwlmWlZz1xVDU
Message-ID: <CABb+yY3RMpzBjuwKR3GKyw3h7M9aZkoYTRf5ZH44ewtTWVHo-w@mail.gmail.com>
Subject: Re: [PATCH 0/2] mailbox: axiado: fix RX handling and debugfs name
 truncation warning
To: Swark Yang <syang@axiado.com>
Cc: Krishnakumar Kesavan <kkesavan@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, 
	Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_182959_596312_DA90C92B 
X-CRM114-Status: GOOD (  18.56  )
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

On Thu, Sep 3, 2026 at 2:17=E2=80=AFAM Swark Yang <syang@axiado.com> wrote:
>
> This series fixes two independent issues in the Axiado AX3005 mailbox
> driver introduced by commit 14af7a96afa3 ("mailbox: add Axiado AX3005
> mailbox driver"):
>
> Patch 1 fixes two RX-path correctness issues found during bring-up.
> The threaded IRQ handler previously consumed only one frame per
> invocation even when additional frames were already queued, and the
> RX polling logic could mistake a FIFO error for completion of an
> incomplete frame. It also corrects IRQ handled accounting and uses a
> stream accessor for the RX FIFO payload.
>
> Patch 2 fixes a -Wformat-truncation warning reported by the kernel
> test robot for the debugfs entry-name buffer.
>
> The two patches are independent and can be applied/reviewed
> separately.
>
> Testing:
>
> Both patches build cleanly with the aarch64 cross-compiler and pass
> checkpatch.pl. The originally reported -Wformat-truncation warning is
> no longer present.
>
> As a runtime regression check, Patch 2 was also verified on AX3005
> hardware, where the debugfs directory correctly exposes chan0-errors
> through chan15-errors.
>
> Patch 1 was regression-tested with live mailbox traffic on AX3005
> using a development kernel carrying the platform devicetree support.
>
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
> Swark Yang (2):
>       mailbox: axiado: fix RX frame draining and error handling
>       mailbox: axiado: fix debugfs name truncation warning
>
>  drivers/mailbox/axiado-mailbox.c | 116 ++++++++++++++++++++++++++++++---=
------
>  1 file changed, 90 insertions(+), 26 deletions(-)
> ---
> base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
> change-id: 20260830-axiado-mailbox-fixes-v1-42b9f4ef43b5
>
> Best regards,
> --
> Swark Yang <syang@axiado.com>
>
Applied to mailbox/for-next

Thanks
Jassi

