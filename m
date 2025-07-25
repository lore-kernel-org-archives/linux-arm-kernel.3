Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3200FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u74rPH//c6SnB7FAtWzTEu0clYtboYSpeyULU9wz9Nc=; b=SJGFMtO2Pmhz2dib9pK5bBKkJD
	Svlizig5c5IxIKUw8c/SMTGsqLPCRg3n4A/YQJpLCvo1kEaShqMVbDbxUVNbywGxdLikdHo+k0QXx
	6qhQ32WFOaXGGAho/PaR2GycqPqua5yAAsXPFP6ZMB4vD/j0O9K3uizk6Gnxrl6eOJ5dmPCW89O5B
	1DfoFVK5yXrlk3EpCz3brZ4DZH0si3xEo/rURcBskvbxXtdGb74jSLVAPoT+29PrRtp+yQ3BPQn7f
	Ka6W/Q3uaZOf3dqCqnv1ICn7164JULkWkwgWzsedT7cfS0AqVXQjysHgH/hGKPPiT384ke8Z1lqlh
	z66aBm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLEk-0000000ADjY-1qye;
	Fri, 25 Jul 2025 16:25:34 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLCG-0000000ADBZ-1ZCj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 16:23:01 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4ab3855fca3so306701cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 09:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753460578; x=1754065378; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u74rPH//c6SnB7FAtWzTEu0clYtboYSpeyULU9wz9Nc=;
        b=PUdBmXnt8bnbu67rwyxnNC6J0M0OQMFrZEvXummO7+1/B18q0ZBD50lerbuHT3RNLV
         3jiI1heRLUwDPoE3n6LeogvabT4b7j2kK45L0/DOO4EXE7qhmMEeewOo6bqT334odZK/
         OeVNQKHDdzj5ffsSYRXkY9w6LlOQGKI1Lae3LNtByF8h2ivpMmYSdKf64z1P3ECGFfC7
         3/Nn3I4js3+gfDm59rQa9ygqE3VETBhOO7YYLXcnY3/md8XG0Up6D1sKjnbqnLmT5lrJ
         XVqImVFI1QEXdxinvlYAa/157HPSF7E4f1LiykGNEnojw5gZIoBFyav6HJJqkMv092Bw
         rq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753460578; x=1754065378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u74rPH//c6SnB7FAtWzTEu0clYtboYSpeyULU9wz9Nc=;
        b=LdTua1KhTzgCALiM6Vei/+b3oVq9r62TQpjcY6t/uu1ImbvFeyWV7fMia+7eVZ/dz6
         KveTtH265UsySjlpLiNGXRbS/nh0rVeD/RQ4j+lpAebFxtvfH0JOStz0DdREMhHNgJZF
         LVLUVHWqud6E2tR6aP8ZWAs9NBUeVIxn9X+uKmhS6OAkZFNsMVRDzWNFmOFNT9yzZ8pX
         u9DR0oAHEw6/YXojM83ZyhrYGN525+kUHhRPPImEeT13IB8U231j+5RHGxFkoXKDc2Sr
         5rIo4wiMBGN+Nw43lKD8qRaRAmQhai1r4PBLlK9N3r+5tP5wiQo9XwY/HZoFWmTrVvyS
         CHSg==
X-Forwarded-Encrypted: i=1; AJvYcCUsHB3F/AB0erVreKWg3pQf6Up6QaUH7j8n477SC0esG9qnBD2VQhShOTLI5hG/fhmaihSrSfAYWjLwfLsJDqxk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Rg4q1Lah057tgostQKkqcEmFvJwjThcx+7WbDIEAm+aaTM+V
	Yx9Yv4GrcvhIMpAkJCQO1vBClydN32YKsD9Cm9I8CYpQz9c5H9QjjgO79JHqRjPFPw4BwKr+7y4
	lMjnUm6cdrVRCmbb3Hw9TxuUBOFgT54CPaiiQaA4Czn2L+V4A8yaeAQ==
X-Gm-Gg: ASbGncuCh48am2ZYPCt4bWmyRXJbor/A+4YZCKIm595HbU2G8WgaOfx+vQ7DO5jIeki
	HswXvi1ATlcRgFEukgHfFiEeSsyyPvN9BhXXlsFIljvK/uq7/NAX4EXRGZ9IHYRXmUCmaomtj8l
	SiJTiNsAZ5YmCP4BWxFzjvu6gQ0Ta6bQaTxrRnWp7+ZnclhKTd31Af+Zu5XzH3QOnBjHT4IQCRZ
	MJ4Zhk=
X-Google-Smtp-Source: AGHT+IGD5SL618OivdHgf3YPz/VJY7lvtmasgb/RxMGs4CnSxgWUrrNPAHtyRyqEw8bJFf0csvVrx4dlWjbdmBruZJs=
X-Received: by 2002:a05:622a:1a9a:b0:4ab:4021:b919 with SMTP id
 d75a77b69052e-4ae89f706d1mr4756631cf.26.1753460578147; Fri, 25 Jul 2025
 09:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250724235144.2428795-1-rananta@google.com> <20250724235144.2428795-3-rananta@google.com>
 <aIObyUg77Um6VB45@google.com>
In-Reply-To: <aIObyUg77Um6VB45@google.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Fri, 25 Jul 2025 09:22:46 -0700
X-Gm-Features: Ac12FXwiy_BB8KHm3Sk8akfrBLEAKIqgsoVUrcDSZxShyAtLyS64CyISJLMjXEY
Message-ID: <CAJHc60y2-NvkyaUEsy4hKnGTwQy1HJSa_Mp08xfyeQkvTKWn2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Destroy the stage-2 page-table periodically
To: Sean Christopherson <seanjc@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Mingwei Zhang <mizhang@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_092300_411074_ED564BDB 
X-CRM114-Status: UNSURE (   7.14  )
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

On Fri, Jul 25, 2025 at 7:59=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Heh, without full conext, the shortlog reads like "destroy stage-2 page t=
ables
> from time to time".  Something like this would be more appropriate:
>
>   KVM: arm64: Reschedule as needed when destroying stage-2 page-tables

This definitely sounds better :)

