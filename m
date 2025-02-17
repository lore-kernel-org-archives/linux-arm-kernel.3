Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B220C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 13:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77G+qwzoFLoNAsQ3YZKaFAwVbGfr3rRsvhGhU7TMI/g=; b=R5z3VKfaB2tecnA8ohQ5Q5UBLT
	+fRmZR9x7W8vE+T4kKjm5etokR3UK9455YJnDibdZiXek2LeO2LhXxPe4Qs+EWaacBrql63NmcsUk
	++vueLOm9/1oNgBhyNqgIGztZBxFihEgBDEpVF7BSYkPE/VTbfblqYfjGYNLHIEpe3SJzNNRWBGRN
	mw0HMoXCqp7Q9veN5QB0fDS7qJe72gh8aiKjKgvgaObIKItJ9YzfNuT+xqre3Pk9hD0vLW324SGyR
	oPEpLgqggHusG7V0QXDwvr126ITybrT+BWPt8KHQT8Xd3rEyNr2xgvPQmqrk7E8TquYvXq/3FQOqg
	kZ1Pg/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1I2-00000004h4D-01YS;
	Mon, 17 Feb 2025 13:36:02 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk1Cc-00000004fhB-3RC8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 13:30:27 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so4395297276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 05:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739799025; x=1740403825; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77G+qwzoFLoNAsQ3YZKaFAwVbGfr3rRsvhGhU7TMI/g=;
        b=e5W42wYmw1/KzO2iLWG/tyBP4zvqs4NcEgPhEbsg3rnLgJcz5vblx1GEfTJPsN3kz7
         D4aeyN0dDlgyXi4ifP0BIjfFPvPouS3mWJpTxFp+E00XnIud4DP0EUhW06EOkOLeRgnF
         WXDmPb4kPss1evcHYykF306add31b8cBfTKXUpcYnv8PGgmkYd5sXAUMXTW0DWIpZubf
         Jz0QL7S7HqqmTDSvnJSDLdrqaN6m02l870jYXsDdwA07yZX12USRZAvqG5JytNq4zrGj
         GXNwQw9s9ZJHfbPc9ISXf2pKTiJTehLkaxYhxvccLiGcj5YZQyO86ybxL/xHTuL2X0/7
         waQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739799025; x=1740403825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77G+qwzoFLoNAsQ3YZKaFAwVbGfr3rRsvhGhU7TMI/g=;
        b=WrAq7CbgXSoG+M7oVIA6wxLlXPUR7wMTjLs0QtwIomTrVH+H8BWgVbfbVpVRmc+aYq
         wjFzuJf2pEKgL5ZDYqwjUUltWfVrOSJFTvRi6VgCqvuGOLcja5x7o85zlPj3vRZ9xRs1
         82sCVROpjk1GxFKyV6FODwqvznLBO4VTHMirv1bYarbV/OK7yBA6cjHW0rMxMq6U6HIx
         vsrPJWS/Q/3c2GZLugz20xbaGW5bcuKTZMPcbT7/cT5XVIuEhod0gfY8FJok5iw+dsRB
         D4yeGW+b8VZ60FZ1xWPMixSs53jK5hs3/p7CzmpI5ubC8at77vWCmSqaTkQr9LkP2Y6v
         23pA==
X-Forwarded-Encrypted: i=1; AJvYcCXDSRAgWNnMoMkbaJI7ZVsc/SwgvyQ89jewlfKqnC7/mIlJLMNW+SSyupRXwWidpY1u7nEqLEVx862euXAm/eqZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwMU+XWVvTTyXXeuikb0tNGZj5gWEMR9BUN6RrOyOdXUECK8r+4
	La39jhkjtQOD8pkFvAHxCkJ39lle4gz4FTIEZda60GRnWdRXLI3wM2ie/FzL+BybQf+3dULAH3z
	/St/c9XgDdJ82R6usLrJj8n6NUGs=
X-Gm-Gg: ASbGncsgRKvr+iCDW2miyxdBGewwwa/QMM2LsuUQMM94P3+edTH0fap2ENIGRdu5xPB
	soHZFcPCTdXLaOkD7GoEuJbT0XtFOLzgKhGvt3X2KzYwPeFqDcPFKzDhAmXW9ev+csWGJnjBVGg
	==
X-Google-Smtp-Source: AGHT+IEB+MJzs+GIv2z74KvmTn3I75FACBN5SxbyoNwzXh0aK5QoppHOlpFhtMuTvychYCVQsoczFA/mnvfT2jm3ops=
X-Received: by 2002:a05:6902:3387:b0:e5d:bf09:452c with SMTP id
 3f1490d57ef6-e5dc932727fmr6866952276.49.1739799024419; Mon, 17 Feb 2025
 05:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com> <20250217-adpdrm-v7-2-ca2e44b3c7d8@gmail.com>
 <40e59cf1-86da-4c1d-aafd-f409d8179167@suse.de>
In-Reply-To: <40e59cf1-86da-4c1d-aafd-f409d8179167@suse.de>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 17 Feb 2025 14:30:13 +0100
X-Gm-Features: AWEUYZmCQ2KktIIoXJ32NnC-FVTPM5zygmYh9xHWyp5QfVtkMZOiANCC-UiM5nc
Message-ID: <CAMT+MTS016CLK7cawdF2kKv2tpGH-N4p3rqGLBPLkPv4A=j67g@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] drm: adp: Add Apple Display Pipe driver
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_053026_857711_2CDDD68C 
X-CRM114-Status: UNSURE (   7.29  )
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

On Mon, 17 Feb 2025 at 14:22, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Unless the described problem really happens
> in practice, I'd drop this workaround. There's no point in working
> around legacy userspace in modern drivers.

This workaround was put in place after we noticed x11 either preventing
the userspace daemon from working, or breaking itself. So, yes,
it does happen in practice.

