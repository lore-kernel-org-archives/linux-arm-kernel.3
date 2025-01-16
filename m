Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E94C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 18:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtOVxbgChZ7onBpUetKBIJWrka8DDr9EfUQBHMNVzrA=; b=MUMuCk8J0aTbOIsI+rnuFcHnVm
	YXZHlfngvf3wGUK0o4/J6epg5PbcRcX6nKx4E6dHbZYOGLC9MK9HiaVEcCTWYaoDJQoU6d6p/Ey4b
	BU44xT6ZEewIWZskac4krdHENCugp26nFH3GJypJnSGGM9buwZ1mMwgV8cBLEawHo2XKmuIDSAy9M
	siFCjI9kGN1chlCdNtxzGqYZY0IP6LT8/ZUx7P88Ue8zCoZNX9X/1hDZ0G2hG/3J7jVyxBH6ETJM5
	Fct6XA9CFVd/gC4H0KJlh1amFMSNQIcN8OTHSiS5ZOZypRjuIkoetmA6HeSXXFwKyo/iEYIHhXKvG
	hVtdy9Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUQL-0000000FmD9-0QFh;
	Thu, 16 Jan 2025 18:16:57 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUP5-0000000Fm61-1hWT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:15:40 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2166f1e589cso29813035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 10:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737051338; x=1737656138; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rtOVxbgChZ7onBpUetKBIJWrka8DDr9EfUQBHMNVzrA=;
        b=gIPerk8Qv+M7U97s7Bf5MFea9skavYn2g3SDeyqKVktjyTPTY9bzLEWOw7TewaIkUr
         k2ntvLa8nF/esbM2Q1mYeTwDt6doK8JgkXeGsqpS6bbYyAfSyLheyBuGLTkYJaLD7+RT
         aX9KOBqZQchEoA6hNvopdWl9lsfWC0BKoigFv4chn8UUv7QKo7AAWZ47XduJS9TCU80N
         SYEZBa9wBrs5KTbx0O+Gn7aweCn83FCmtRxsh4M3NMlo8iUo9ARH/TMWpGwsq/XG3TEq
         joNT8A1VPBWp7y9ELbmBtkZ6oqypm1l1jvFIPZ4+D0RcNJg+M8on0PbMXPTH85URXVCb
         uf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737051338; x=1737656138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rtOVxbgChZ7onBpUetKBIJWrka8DDr9EfUQBHMNVzrA=;
        b=XHDOqAfjuZlieb91n5h/T9UQZraru9txAkRS/GouJfln06SGLK67r/iwtZpBVG4qz0
         R1IZaCZUV0nGSqlcjkPvnPfkcA+IreHXh/lVJVhJRSWDvv7N4718Mzw+ipOAQpjyCOoA
         3OqN6zZeDnPsMFWfyXVNgqUcEHhxaMrRLF/RRAR3jIju0OYOelAGpMsqoMD9gAIX57DA
         i/kAqgqQDCdAi0M33EJSe6zwyxPy8OTxlSy8dAKSPkOgkbSS5ONEkP2KbsWDLqeY5sMc
         lueg1OBRrBy4MI/dKWKoD5lXEZEb9e+KDp+CBoCxx8TVugTLdLLuLUyKqLhEQm8qmQYg
         biEA==
X-Forwarded-Encrypted: i=1; AJvYcCXylIZhTex0UFeOUJE8cJEIfSDhhPy8Z3MiC60PiA97ALKzRzM0VOb+6bYSiNGZi0QUY6pPWE++HWwqDRac5pDE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh3DwGW/LJ5P8wtAxxY+nKMOdzTxuFKx15uRvylmGlNekwwF3Y
	Nl/g+/rOiH7ycFpqvYfiHToQZKaisRN0LKn2iF2gK68LhnAzkNzhxMbgsQ==
X-Gm-Gg: ASbGncukJpEoO7dlPns2CS0uMelB6Is5STknL/kuc/ei+d3Ue0XexwQ3fiiCqwHNofW
	9IQ7PfY6ZU4iQz9c0S3eSeqkrnWTb8stzr9jnP359zHvUcSHW7FbaNmp4KGISwk1iwzWx8bBcmt
	ZtQtAg8Lo7ymxbwT4UyZ8S+2EOLlD4fis/DM6JJ9y10fCc4lDwf8mI8sRs4Aeo7xIfQPakz88O+
	HMim6Gzv78sDcEE0wSIfW+RmYWEb2HUcD/LKqhkFLbYgfi11p+zEBeUWQ==
X-Google-Smtp-Source: AGHT+IGdo5ig12ulCIg57VUHccD9Uy0qJdr/79Z8+d6H17KB/rpCQR7jmI4tw4oL7Fnmr9aw5T6/Xg==
X-Received: by 2002:a17:902:da82:b0:217:803a:e47a with SMTP id d9443c01a7336-21a83f3eff2mr499223585ad.4.1737051336701;
        Thu, 16 Jan 2025 10:15:36 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:a7ea:d193:fb69:2f82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611f0a0sm438250a91.6.2025.01.16.10.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 10:15:36 -0800 (PST)
Date: Thu, 16 Jan 2025 10:15:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: devnull+fnkl.kernel.gmail.com@kernel.org, alyssa@rosenzweig.io,
	asahi@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, fnkl.kernel@gmail.com, j@jannau.net,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	marcan@marcan.st, neal@gompa.dev, robh@kernel.org,
	rydberg@bitmath.org, sven@svenpeter.dev
Subject: Re: [PATCH v4 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z4lMxdFWrZorX0h2@google.com>
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
 <20250115-z2-v4-2-d7361ab16ba0@gmail.com>
 <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_101539_442876_90263BE7 
X-CRM114-Status: GOOD (  12.99  )
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

On Thu, Jan 16, 2025 at 07:03:13PM +0100, Christophe JAILLET wrote:
> Le 15/01/2025 à 23:46, Sasha Finkelstein via B4 Relay a écrit :
> 
> > +
> > +	/* Wait for device reset to finish */
> > +	usleep_range(5000, 10000);
> > +	error = apple_z2_boot(z2);
> > +	if (error)
> > +		return error;
> > +	return 0;
> 
> Nitpick: These 4 lines could be just:
> 	return apple_z2_boot(z2);

The current form is actually my preference - if a function has multiple
points of failure then do

	error = action(...);
	if (error)
		return error;

everywhere with final "return 0;" at the end. This way it is easier to
rearrange code if needed.

Thanks.

-- 
Dmitry

