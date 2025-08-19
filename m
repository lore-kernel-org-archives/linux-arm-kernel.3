Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2709CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mi3M08Gy0PoAc8Y6YQtFVDIBLGpr8qeW8qRK7d3r3kA=; b=QAakY07W9OIUh6ZS49S6+qecxr
	Rkm9fetQhnxPd+F66OTEYBZDqT7J1Qbf6pZ9E6tj2UwlP/nGvK92HBf2p9ubPm2oYw/Oy3yn0jUXV
	bS31elpHLyfGS50CC3xfO6Z/Z9Z9zI2Ra4dxvW21JYAy97M4bIPY/qitu/xJb0+4XctIbMgnRE3Hp
	8gud355yfIAHnONG+mpSflLSnOZb/GAuFfTfMTrnbkQHZunPh1/Oke8B22CmLu460aU3bkRA7TqdF
	4OyrYsr5pbZNeLeqdpcjHH8Wi4cWDfqUqy0mzt7HdIroGHVrFhZuuYuPakV6qIinS7CcUszXjfF+D
	LwkgkHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTAO-0000000BYpL-41uw;
	Tue, 19 Aug 2025 20:42:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoR4l-0000000BIed-0ml0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 18:28:52 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb732eee6so917758666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 11:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755628130; x=1756232930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi3M08Gy0PoAc8Y6YQtFVDIBLGpr8qeW8qRK7d3r3kA=;
        b=D4eJJhVOBr+CqROskLGMMrDUIvHlSoKm+irGv/isP/kko7dlB1hmsZilVqch+wngxI
         je2W5FW3ag5cYbeFYEaEqhfUkwRzkYbwa8fcVG3AbJvjvZQVOyY+lIj2ZESGPV0/4xap
         LtkQJomOpNY5izICxtkP6smJrZisgGb28o26xnpxrr4/XgYHeqD7zHrIfaG5tgz2yqW/
         WWsydJ5OFwg2qhfq7Vgd7SxMwuiwfNtD4PzhNLFpLilSVHF65yF7DdB9eca4fB8M8DkW
         OtefZMEbbliqj4K+GJXMkGUchAaK7j78WLZRg6eHMpUJBgjuBm+QjV6UE/XrZC1IGOhs
         Gmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628130; x=1756232930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mi3M08Gy0PoAc8Y6YQtFVDIBLGpr8qeW8qRK7d3r3kA=;
        b=r7GMUmHiSG1tKYdqmGhPgte1Q2tjnBYDZx32khTasClwkcuq/HoNyAemBeYKnzx6Qe
         0aZYWtu4vfO8psjtTyWNUDSl2ypJpkBHvK6NDAeo26OB7DVPrU9y+CZwb/ewt9iw5R8c
         L+OSIG5rD84s3YKX5vCiHvstEzvKS0UycJQSuX7lj1wKdiAhAOmR+ln+m0eZk63QGgc4
         xfnISIAh3Bawx8NlZH3wIil3MsW/DFk4hbWUtlEeuqAai64yGIukM9pj6uDpGsodfxT/
         WxNz+0y/pyqh80W2w3zXp49mk6Dmqrv4rCsT75j3YsQv0+8mAQkBPQlo9IfMuD+fJPoT
         SG2A==
X-Forwarded-Encrypted: i=1; AJvYcCWUYRukDNixOzh4PwRdGh2m7CjPTUh3CTjKWBl6VRxu2Yn9HEIEYYlL4pIF2IPRQKQuBlC4RHaq5MnfM3JSoP4l@lists.infradead.org
X-Gm-Message-State: AOJu0YxQOA2Ei5WUfbFzCevU/fR9HGhB1s8mCC0A9XK/iyYHHe/KDGiH
	um8/AHBqhWQ7YnSACNhkrTatw6T6xD41ebMIDGYuh16QIb2JO19mzdr5StPGP0KEVsmktqnfn0Y
	5V5J3T1fCA8LAYBxs8cC35jWgKEz/eP8=
X-Gm-Gg: ASbGnctV0bdel7HHfF9s84XAymQr1fi6vc/6EuEPDxhDmWmmdxHgxNrwfS3votmPZrv
	++TS3Rs2weP9CMALZhmpCCgT0GAJ040EO0OZMMTbr44tOvCDVJeZjvLJPR6tq2fkSo93Ncczt4n
	qAJUchV7/jCG5voejLXenjZeO29O9nMeY/oLuREh/OQ97HJjZTw8TIZ+rOO6lLseqEzL9VGHkM/
	hbHHgW3r5MgD/716A==
X-Google-Smtp-Source: AGHT+IEeGP1LFIY3EXRErHwtTbv4M2rk6nG5tRrYGtcmXGZOPqtXI9ACwjR9P80bcK39Tu/AL10NJ9kb41SRcmv8mC0=
X-Received: by 2002:a17:907:2d10:b0:ae3:6ff6:1aad with SMTP id
 a640c23a62f3a-afddcbb6b4cmr359441366b.14.1755628129253; Tue, 19 Aug 2025
 11:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250819150448.1979170-1-salih.erim@amd.com> <BY5PR12MB4212A540F9799D6F326003388B30A@BY5PR12MB4212.namprd12.prod.outlook.com>
 <20250819184442.25f6904e@jic23-huawei>
In-Reply-To: <20250819184442.25f6904e@jic23-huawei>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 19 Aug 2025 21:28:12 +0300
X-Gm-Features: Ac12FXyqadw1CvxKvYip12xTlF6JPr577hQM-tFyzXAossPM7HYZ5j8d-rvSi58
Message-ID: <CAHp75Vf-daUx1H7+PgeLsvpQsEJTV_9AVdkudCab=KVUw2grVg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update xilinx-ams driver maintainers
To: Jonathan Cameron <jic23@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "O'Griofa, Conall" <conall.ogriofa@amd.com>, "Erim, Salih" <Salih.Erim@amd.com>, 
	"dlechner@baylibre.com" <dlechner@baylibre.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>, 
	"andy@kernel.org" <andy@kernel.org>, "Simek, Michal" <michal.simek@amd.com>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_112851_223004_6748CCC2 
X-CRM114-Status: UNSURE (   9.79  )
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

On Tue, Aug 19, 2025 at 8:45=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
> On Tue, 19 Aug 2025 15:10:15 +0000
> "O'Griofa, Conall" <conall.ogriofa@amd.com> wrote:
>
> > Acked-by: O'Griofa, Conall <conall.ogriofa@amd.com>
>
> I'm not entirely sure why but b4 only picked up:
>
> [PATCH] MAINTAINERS: Update xilinx-ams driver maintainers
>     + Acked-by: Michal Simek <michal.simek@amd.com>
>     + Acked-by:

Due to an unquoted comma, I believe.
+Konstantin

>     + Link: https://patch.msgid.link/20250819150448.1979170-1-salih.erim@=
amd.com
>
> Anyhow I fixed it up to include Connal's ack whilst applying.


--=20
With Best Regards,
Andy Shevchenko

