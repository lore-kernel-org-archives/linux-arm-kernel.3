Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01D4D6AAF4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oBfne9CbSq7TsD62MWlNbHi0ATWBOcJIGvZTuwhO+c=; b=3/DQAjnxpcbjpRFL3wAujSIqDV
	wR7t0lTVvOdgB3D1RdQvKqfiCqw36zltqIEiUaLHqhQ5gwbRkuKf2qT7Iv5Il4nzzOp2OTAPuIMfj
	zNpcNA+Lz+nYVHitnx8+2eV405hQg0sDOWMw9a4UZrGR1FB1MZcjmBxbolGYYvNbVLdhOkzco8bDK
	harbk7R5i3Bp1fkhBtn07Tg7aEdoI7MHz1kNVDxGKJEhilyp3cIIn4oalkwNnOU75iK2UjzHaTv3s
	ODzoMb4Y4+1I51Z06l07SiPymn7hlO/6xCg5eyrI61ZNkf5gn5ur9PVuyF3XJ8rGWFT/o9HaJG9pI
	96e76U0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MKZ-00000000cjm-3alP;
	Thu, 02 Apr 2026 17:59:47 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MKX-00000000cj1-2hxM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 17:59:47 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-467166cb638so444913b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 10:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775152784; cv=none;
        d=google.com; s=arc-20240605;
        b=EUYOgSluSgpoDj9P0+faJzKGW62Cht9sX33n0LGPf0W1BX1vGa/JFb+dLiFBRzROuh
         AjYet5BQPIvUsHukiyewm/mB0lkXZFHaXQH9piJtV3T1ScxXBZsGZFy1alP9kLYq520x
         qbW5rijoOMrKp5gltwGXrOD21Dwqa3jUQhlU9W6wMgJGzpsxTxLowt1FNdHQDauabHeX
         3WUcUc0wFTeA49k+IxlcjwKMqRmHNX36Xazb6qc5eFncXrA+V/nthTtBSf7cWkyA47FB
         yvYMYhUtqelSlT/1PZiIz91SiS1X4jda2dm2uGl6FBA+vyXaIdufOT3jQgaMfpwoHsgS
         3Tlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6oBfne9CbSq7TsD62MWlNbHi0ATWBOcJIGvZTuwhO+c=;
        fh=hlLQVaetip4uP3NGGxiCX8pV6J0aWe3IhunaKA6tzVY=;
        b=hlt6AI83r67Of1SzEbKtzXLhCKpiPtqHNrl0m8GubAWg+xOervRdq3g1tBd5GCpNAg
         HIQPUp20qj5B0ndohXmji27Zo/IKVp17l5qOTK3OEz7tQmyJtOTRJf5vyuqFdtUlxiCc
         W/On0Gnbdq40tTZdd86BkhRZcjDCC67ABIP+3WybGrH7SrJ2maVMXlMdcitkRGhtafAZ
         bpqs9ZXRVKc7Mry8x8f2SA2JFDOBxNLUZ/LfYxrDViMloxKwDN0GSFQIKIkENDw3U+f3
         qYDGmaKiLGDckGDr0bT5ML7S4PBvpqRoTlMiTK01ADVwxY3eYLLStfiL/uxaglXYNDlR
         5Wjw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775152784; x=1775757584; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oBfne9CbSq7TsD62MWlNbHi0ATWBOcJIGvZTuwhO+c=;
        b=mDGFBLVDyMCTFjKlGcLPcmOiZk8LWI/FOeXwTEMjFQuXb96ajxQgx/biWNR0Ib30Gz
         11qw6M0OdZgYWJU/lLgPAkdslEN7Q6aYXZQMwswi7zH3ER2W6KZHaptnsuw2y2iSSb2W
         COGO+uwAKFE2eE5jNrbk5euwymihDs2dNDY99hsXi+DCfKtk5Tcm6v/eeN5dLTGYdbHz
         2pfmHJnoqV95Wz1/nSpyNomjgp77FHS8pAHv7h3UagfGcI3NPVzH5MKd1LA/nKnJK+PJ
         gWT9c6Af9rq+DAtOq1VUFzc+sWGpHtyBA3zOp6TWen7ILU13Cn0L36rUsWWI2LEYxyf3
         o3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775152784; x=1775757584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6oBfne9CbSq7TsD62MWlNbHi0ATWBOcJIGvZTuwhO+c=;
        b=RDPH+T3rxWvWJglt8rD/iMeqyxjTFnPDhxsDY834djZbr0vPF0xPA4YNOPtAVR+imH
         mFZ0jGOJnmpNHJBzGFFj553oShJtiI3+o+j70qGn6YXjbdmSp/XScbZRMG2XHL90tsMv
         OXEV0P7vT9EF2CF80rP+Ut1AcLqitHxTYXh1eoZuJEcxml7y5LN6kNloeY+ZlZl1Tdqv
         E5Ornp+onajWTqQs2Gia/pAY/rcQzUVVJo6jktBu521tkYwSWOExjaaiz/UDCToNC0oo
         fYZ1Oc/sF8FlLi6FLRLV0cNkFYFQEfbf25Ug8Z1LDdNn309nAK1Wh/8CpdeLguL+Na9i
         Dlew==
X-Forwarded-Encrypted: i=1; AJvYcCURfflpAmw9dp8DhyXb2/x8uMQf+cKpH49wIE51DIsuoTxfa26yDo04j/FeRX3nNMkeD7zIZcOcpPYjKypzgr+o@lists.infradead.org
X-Gm-Message-State: AOJu0YzTsxn9uL3YpqDzztBZM2bArng9AtQX0ycFV7J5M51srPOJ/KTd
	v4mOYOQlvkKplH+w1P1SpYr6CPzFB95S9lyIm3FdgnxD2rztYujsViHaf4/0px0sncxUTQdfB3b
	lBRGbBFl9h/sOzRhAN7HCZvDIrsYuhFk=
X-Gm-Gg: ATEYQzwsjFE7wOa3q78j4u3lQmo5hOQ7P4Ge0ip57SZtKUi64JyU3Wy5conXT2K0vU2
	fD2qFRJ0ZojN4DQABIRAcRqgm+IlhfB6Nts/XZMDxsDaMZyqNkKyTeshTUJbFMdpvfnfggUt9Uv
	gkCX//kJ2LLHp1x2l+xRf7qAPm38ge/uyRWliOhUZjxxEor7myqbB1cS0a/lmqfyoGgxc1lLR+7
	vMKjLuxO/9dBHrGfcTpdZ8CFuGBNf7MijwwGd0Iv1LFSFXwEANgW+a9t0mTh45dPP7CFvEdYSjF
	BFbGef2g
X-Received: by 2002:a05:6808:d47:b0:450:bbed:7a75 with SMTP id
 5614622812f47-46ef7309386mr165326b6e.28.1775152783969; Thu, 02 Apr 2026
 10:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260402170641.2082547-1-joonwonkang@google.com> <20260402170641.2082547-2-joonwonkang@google.com>
In-Reply-To: <20260402170641.2082547-2-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 2 Apr 2026 12:59:32 -0500
X-Gm-Features: AQROBzAmx7Mp6DrgKOrwAcb8k8UUyDzlYzRN_6Wdz-72pTbSanHYGSjh0AuoTJQ
Message-ID: <CABb+yY0ub51k-eFpPfgARXtwYjWzRSjbPDLtoMD77YQR8JH+=Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
To: Joonwon Kang <joonwonkang@google.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_105945_691896_A7C2821B 
X-CRM114-Status: GOOD (  16.71  )
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

On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> Previously, a sender thread in mbox_send_message() could be woken up at
> a wrong time in blocking mode. It is because there was only a single
> completion for a channel whereas messages from multiple threads could be
> sent in any order; since the shared completion could be signalled in any
> order, it could wake up a wrong sender thread.
>
> This commit resolves the false wake-up issue with the following changes:
> - Completions are created just as many as the number of concurrent sender
>   threads
> - A completion is created on a sender thread's stack
> - Each slot of the message queue, i.e. `msg_data`, contains a pointer to
>   its target completion
> - tx_tick() signals the completion of the currently active slot of the
>   message queue
>
I think I reviewed it already or is this happening on
one-channel-one-client usage? Because mailbox api does not support
channels shared among multiple clients.

Thanks
Jassi

