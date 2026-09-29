Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07A8C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 05:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywMDNY3EI7iDZTym+kV52AlLxDjfRMFnaIbif0jeJZU=; b=Upn1YIusVSEIBufQSckHkaJFdt
	ZeTtUMrFl/O83dispTNQ/JWCN3v7mtlls5Nc40vVlsKPwB9vzQSb2I0LjqTZJolf8iNFQQlMHIP/+
	xD110nBT/szsYUKl0h7SQ+J9y36ym1yiaWobgCdt/lCu3VQLCBsm84bmGG7XPFznN/jiHQCQ4g4hD
	X6adCMG2zxdLTpDrJsVWKNt8is5Ae4JtzqEY5NJxJ1YQdmuHMvOqxUZXAv7k6clqsAectvMZsNaO8
	r7IQW6hz667ON/7aG5kwyA5rP3TxpjVlxUQjfPqa0+D1Ij/7+g4X5q1fGxKhFe2l6eF6+Jz0f2uuM
	xPjVV1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBQXM-00000002NM6-3VqL;
	Tue, 29 Sep 2026 05:37:56 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBQXJ-00000002NLO-1NyZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 05:37:54 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so6115361fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 22:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790660271; cv=none;
        d=google.com; s=arc-20260327;
        b=mrcwO3kTOWGmil0Bmk5r6lcIfyJP1BVID2VUsxqc/ceTmLD22toGzYDUadib8zNSWi
         +C/XIwxhHSbI8pyVH4br49WhYSa3wjYJfhz+9HLlD5dMbfJB17/m1i1HOb83VSqdjgoR
         TCIm7olEfKuGXaotBDNo84rQ4UdYfOBRPHTNYdI60/qQk5msAV77y+Vn6T4Euovpbm9E
         MDClPS+zkFQPN+I7G0ITuFHAOu477Dt61XwfXP2BjpoGAaMUC4TzlC0FpMef4oR6GLzU
         gcorG03Ga9MyJR1jEVeChsG386qBF6W6ojsC5bY/PlApU6d3hTLcFo9EHOc2NPQHuDgU
         PFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ywMDNY3EI7iDZTym+kV52AlLxDjfRMFnaIbif0jeJZU=;
        fh=CIQu9uMe/5Wvx8GA5gJCiQwPLbrwAxo5dO4Mu7pM8AQ=;
        b=Ddvd4WNUryH8vmWWkpNpsdI6EfWqGnYYU4WCzJg3DnRGroEN+KX35YsWHsasfzB0Vs
         3EtTBxuqUvU1d1ecLKJcRPJcB5vnkOwxU4Go4DhdEG2ndZsebJoTQsOjBx8JOMBODGmN
         506E1ZNGh5Ru1hm8qVfhaW7d0tg8g9ymgFLxu71zw0+bON1Z/QuK3PbhooEHdlrSW02H
         SWOVFPaKxNH81jd0BG2bq6davaAyGI5FNlim0do5o/fFJrhX6rbCRm2el0V6RbA6+P2o
         Zh1lpMzKkAOcscX5XEHfN/6jmpKGp0FvP7r4BX4ImBa723fzuexIgWimNZs+dMGETsNr
         iS2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790660271; x=1791265071; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywMDNY3EI7iDZTym+kV52AlLxDjfRMFnaIbif0jeJZU=;
        b=ZqapYxvl5nmknnuiWPFMHtHxNEW/lGQkmK4TPKlmSuKS0d0887MEaGzEDu7tlmv46W
         7422aJUeJtEksyI9AFKyju9LgTR0v3+KxKcH9HBvkOmqhREdc/LPQntNSiZArVwoRcbE
         1H/4HrH0py+t9y1qGzP6KYDfoLPrZGyz8PD6JnC/2rQt2E6ldKn38ysWFPU8PvXHojcZ
         7NMP/KiLbHDeyfTk9CQOru3FIX9UZWEPYm1CItKRGf/4EvWUX13UvOxymf9F1NHbjSai
         +cSpCybyEthGtDaGRfDEvdzht2Xaxg/Tk2en6OGJWEZ3GCYtaWb1XqoLfqCPo68WrgZP
         QcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660271; x=1791265071;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ywMDNY3EI7iDZTym+kV52AlLxDjfRMFnaIbif0jeJZU=;
        b=b3T7MgCjjjtYqAX1SwYEaUHxg8SBOj3564P8EkoNOFWbWDKcOcBnuKkfywMIQmAYWe
         7PfvrtKpXNIAcEXcN1R5ffz1dokf1RL4eWUEiEtQUnEaLnL+bU7X8KsDJ40b7RHR/MFj
         pQzgOomFzXVlCeO4wn5QcbpIbmK7rzsTWQiseFJouEvjaX32WWLO1xvmmommpU2fZPBR
         GLN5KlRuIE5eF/o8mDJn3q/5X6WXfD61GnJbEr/H2MDCMT19k1mb1LGqp6UNK9J0xAqj
         kciS7U7OawCxN7aNOPnQZ0MccFl83+diT4dDQYhN6Ew7hMDr80eYEASto4y3y0NJem/N
         XQIA==
X-Forwarded-Encrypted: i=1; AKwUvByqrDlh2bZfZIO0AbDQBO1YBfQ6LOkbThsIpeuKi0MQSKwhVo6AGr1ElZPLPPokTVYTMNZPw0fp+JWCGx/1i5sc@lists.infradead.org
X-Gm-Message-State: AFq9FYLWhxi420hEy2pMJWdfBC5gjz+5nwTmIZIC8lGiP8Kmi1MiE8qU
	HYddOwtfYvkSD6VRTrX3n327DoN4aXsGtrIMSQ4YZCpqqAHaIITzFwKSzZFsS+eKI4YL5+ar+7O
	XIx8bJy47HVrv63MQmwCXAHAT64Cka1k=
X-Gm-Gg: AYBFou0C/0Pm04SBRj3K88uSOapyskWznSgBbKLUDp+yKitBQBSbfpyz6ohEVcU5hvG
	ZbxfnMICCck1505AVOYiTtNHqIJvPEoxrD3/RB57SzYZrDly07VStXNtzzaQ3lUoP/hFLpO6sOz
	c6KHNkRcGW84eD4/q98ihL3Waq4sWFujXC84qnP1dDjbWZA6LQpM2x2bwhVi5s7dbZyQgCaXfH2
	YOms8MlXAJ9ihlGA079n64hWtfPRdN0XxBdzZYSlqD/trumn5fnFh7EMJu1dkaEjztq5sQt7/MD
	kbmj6o/jc1bm+8z+mDbGx4wufFSsrm47780pIFNcspGX4G7AlrPjPg==
X-Received: by 2002:a2e:a803:0:b0:3a6:62bb:906e with SMTP id
 38308e7fff4ca-3a76479b880mr2991121fa.20.1790660270947; Mon, 28 Sep 2026
 22:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260927081034.350422-1-maimon.sagi@gmail.com> <arsCWFmUhSYkhcCv@devvm20253.cco0.facebook.com>
In-Reply-To: <arsCWFmUhSYkhcCv@devvm20253.cco0.facebook.com>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Tue, 29 Sep 2026 08:37:24 +0300
X-Gm-Features: AclHuK8JAeWlDi0d7__PRO1w7MUiU220HLhnmM4wnT1m-kDeU30Mnzj_nbHR38A
Message-ID: <CAMuE1bH_=zqxf0-cfJozeaytGmK=q_WK0iwVxP_yH+AkJxHO=g@mail.gmail.com>
Subject: Re: [PATCH net] net: axienet: free outstanding TX buffers in axienet_dma_bd_release()
To: Joe Damato <joe@dama.to>, Sagi Maimon <maimon.sagi@gmail.com>, netdev@vger.kernel.org, 
	radhey.shyam.pandey@amd.com, michal.simek@amd.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	daniel@iogearbox.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_223753_403225_27AF4C4E 
X-CRM114-Status: GOOD (  14.96  )
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

On Tue, Sep 29, 2026 at 3:12=E2=80=AFAM Joe Damato <joe@dama.to> wrote:
>
> On Sun, Sep 27, 2026 at 11:10:34AM +0300, Sagi Maimon wrote:
>
> [...]
>
> > Walk the TX ring the way axienet_dma_err_handler() already does: unmap
> > every descriptor whose cntrl is still set - axienet_free_tx_chain()
> > clears it on reclaim - and free any skb still attached.
>
> The code added in this patch and in axienet_dma_err_handler are almost
> identical (as your commit message suggests). I am wondering if it's possi=
ble
> to factor this code out into a helper and instead call it from both place=
s
> instead of repeating the same code?

Yes, the unmap-and-free part is the same; the error handler also clears
each descriptor for reuse, and frees with dev_kfree_skb_irq() where this
uses dev_kfree_skb(), so a shared helper would use dev_kfree_skb_any().
Since this goes to net with a Fixes: tag I kept it to the minimal
change.  I will send the helper to net-next once this fix has reached
it, if that works for you.
Thanks,
Sagi

