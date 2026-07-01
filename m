Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVUZ4embWnOBiS9PgKFrner9THwK3cnX7ndZCKBqzJ8=; b=swXhyHoKWDeQEtc3h7hbgqPqEY
	V5C1sOqF5glINN/6RFb54E4imdsZf1WDwhy0/N6u6WhrwmK6eFxMDsGFcExgr/SIicUdPBpZVNIpl
	l2It/B98gEVJEZ+/q3iYNuFIIQjAN6rC65NGiIlYWfkqgeH0AygEc1wPRwgQjG0RpYgDeM9u8f5NM
	ay2d929rqeItFqZUxFTq/TkZm8YhvDbFCfwwBtEyFQmJAyk187ctplIREeI+zdWlJShT3q0DAwfYc
	DLGjnMY2S+Po2EyAbGneP96KCtxZ51xx3AykUQvTw+rtBztuAcb1Z6xR6R9VqWSnJ5Ttpjz4M4x6C
	/1gJP0ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevVP-00000002FFW-3t8E;
	Wed, 01 Jul 2026 14:01:35 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevVN-00000002FEp-0IfP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 14:01:34 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-6611669cd16so938198d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 07:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782914491; cv=none;
        d=google.com; s=arc-20260327;
        b=nvEUoQVesVCKGfkJAT1Tb2w4/Q7QBk+1n2N7yJjPeZyhysxPDfkXeN1XZ/2qUf6gfa
         EO7ilsxgZkCmZjzOWFXBIZGl733VEsLgUP6vNg2OnB4qmvVTXVWqZnNmbLd19mbdv1Be
         tQGXo6Rbll4FZ8o2vMu5+JE+fWO6mFQQJ6Q45aBOLh45L2i5Lbz6PGGlsQsG+cpiHV40
         A5iUTnMHmLU37rVGkvHSE9k/7P2ghHNSzGzbCNSHRR0f9EMpdK8NSsSwQVgbf70RdFop
         aBg+gHiwJppF44KhyVsRzHEe9DT47fMXJbIeVfUFuQ9+6gvJswzMr492+dBPIuwiTVsS
         2Zuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVUZ4embWnOBiS9PgKFrner9THwK3cnX7ndZCKBqzJ8=;
        fh=AU9FEWwRm7LSlAhNXrdVST/bwG40hggYxcKEKP3kQAk=;
        b=P8RaZNoYBiKsMVbfCS6vlcMyH7RWStT9tHoQt+ZljMbwxB92vW6q5b5qzYZV8uBaPj
         YGWcaYtiCKV3vdzViY2QG2a1Dq7tYnqtoaMM7dcmcwaAH/JPz/SXf0+8LojKATBePtX6
         QRQ2YoxnKa2b5U88+hd/cOlZkdYhjnvlcwQsLfpWTw/JsNVUBzDXcSTkSoQw3AVrdRqp
         phkT8cfzvmzfmIFn2yej74VUCsSkW8yeNIL6As+tyHk7APDifpjBqinO1fIBurgvb3Jm
         FfW7SjKKk4hKxUzwG73NCS9bZ7Vi6Fo0FrHy0XF+O4x7MNLDqinVtdimvX8FnYQ2Gz+T
         IysQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782914491; x=1783519291; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVUZ4embWnOBiS9PgKFrner9THwK3cnX7ndZCKBqzJ8=;
        b=ExgQx537QULN4KxxojNBcUYnW/35zkCM5B6Iwfc6DJnb+xcKhxZGByJ4MOLUwBUITY
         Hervc3wqcAreK6xfoIf+KU5ntwWR8VFNz4MAXIGkr0POfMaypvKEP1bTTzyMJUTGLyyB
         146nrLk5Gd4try6rTmB3JHAGkX13n8pgSrFIWjKhE1b7BFrX2la/SgqsLaoqZAXmLD0v
         Vv35ZSUSRvi6LvQD+FaFsDiEzkbWYIs5YOc65cKER30X5etBsBBvMGbTbqYhcZ/BJL3f
         qrwVnsxO9LVr/VCLPehRDvKwvBjfbmF1hVNvXHuIvG4IJE15lO9LuKbIjksqGcacx36R
         SfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914491; x=1783519291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eVUZ4embWnOBiS9PgKFrner9THwK3cnX7ndZCKBqzJ8=;
        b=parglQAGyB3Gg97Sf6MDT2waTK8g8cgEuapCTjpnEVhqPCHFOEbAt4jgzSU28ln8Jj
         GONljEGma12/L4ga8MFdVNrpQkdhqpJEzcwJiPaTL3u8lMUXDglhYH3sZLBIY9FDbjHq
         5uopz28ib+S42IoGsDpuS437uovpP2UXVdiUKxl7sbPzXmkXJz0qa7OYs2dBZp2fIlLe
         POMALCoFTt6VnSvNxayLVrRAvw2PJMpGfUj6vPtf9MZFoM+utpt+G5p8fUyqRujE96YP
         47ZbcQYd8X0zVcc/x13LG6ciz43uHFVOKQpgYFjP9yutx1RA9+Fv69aYFXfEeGMKHQ2D
         jtpA==
X-Forwarded-Encrypted: i=1; AHgh+RpKN6EGIomakhfcAvzUf0k81vjDHbvzCqrlqkAPlngycpusbHz+1A95Dv1C3J5iOn++fUijKJQTA+K3CVCIfE4P@lists.infradead.org
X-Gm-Message-State: AOJu0YyI9WVFD9ZVyRHA1JTTQQOWmCqofrnxKxgt+0oaWkYmxn/qUuCV
	WhKq5NcG0J3szIFF37GQkW2ajZvlR5miza2FN+umuQJveMvs+ODB/OTmp3lI+srGfoTOHfecWQR
	3NCbKdSxODtFqZvLqYqPPLEtk/bLZZurBwbaNlGc=
X-Gm-Gg: AfdE7cm7JCz1nk1zqXDzBOhrkXbCc1y0eWoYFRZKTuMR/7068nYLa7AWep8UfR3jajV
	yXOJ19z26tkgZ8hc3en3lJwh6znbnWTx1lP/3NxqMbtRzB98cwhL7ZQ3nzRGmeIadDgdI6ULPJg
	66uiv5X6i70CRIVqOKjoq+pMjzqjFLDZmN4Hn9qPMuYelor/7RGCVk4mZgZNBXuQEB776gClhtw
	rP9Syy/Qj2OWsiLGEaWReIZWhOVw/dmGF5J58z5Aqz69BPbGZ1cxQ0Z3309djBeYK/2OG7lgbUS
	iwqudjic99IJj1MoUKfNDlC5+l/Uf2F4EzQmVCxDifjswkrqzgqWlvcYXoXznA==
X-Received: by 2002:a05:690e:b88:b0:664:ae03:5251 with SMTP id
 956f58d0204a3-66591634413mr801390d50.2.1782914491125; Wed, 01 Jul 2026
 07:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-7-506d936a1707@gmail.com> <B22C8EFD-DEDE-49C1-AD8E-BAEB5C91B6A6@chaosmail.tech>
In-Reply-To: <B22C8EFD-DEDE-49C1-AD8E-BAEB5C91B6A6@chaosmail.tech>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Thu, 2 Jul 2026 00:01:19 +1000
X-Gm-Features: AVVi8CdUm7TRIKQUnleOwtMjaxBDCbjz3iJPuSJcM6iQODX-JToqKlxvunuUfag
Message-ID: <CANpmGNuoS+AK6yOo-S8Z7M9LbOqZXUN8Sgv46L_y=OYnU_orXA@mail.gmail.com>
Subject: Re: [PATCH 07/10] HID: apple: Add support for DockChannel HID keyboards
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_070133_115267_AA29197E 
X-CRM114-Status: GOOD (  11.32  )
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

On Tue, Jun 30, 2026 at 11:41=E2=80=AFPM Sasha Finkelstein <k@chaosmail.tec=
h> wrote:
[...]
> It looks like this section is duplicated in the following commit (8).
> Is that correct?
>
Yes, it is duplicated, thank you for the pick up. I moved the fixup to
the transport layer driver (in the following commit 8), which works
better, but must have forgotten to delete it here.

I will correct this in v2.

Thank you again!

