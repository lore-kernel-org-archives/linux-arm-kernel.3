Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1874AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 06:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTJ4YW1E/d8/IwyVSJf2kPq90RY5NP1f2yDnDVRu6go=; b=l5fPeMRuRNsA68RsrapoUlYMIO
	B9DRZLTlEGioKO0n94KFp1jJDqVvgYBkCpLLwGmy1f1/6dWIKPB93xgGjqqLz5iciOlGIK6UeS29u
	9bykG1Jzx1E3U/tA9PmiVNAKwx7O2zu2AJOpiZYVMdUEW9Pwk/A5YADx/Cy/V79g6yUb4LyVFTZE6
	iFdpo/tAfeNiU9i2Y5VSM5caDDuX4JS88zaeXZIYwdhfyIrUr2HI+mi8zA7DO4OMYT7x4F6oSuxkG
	Nez4k+FeV87fS8W6pfAYYPuu8YX7EJoVzGKf43PMWgxUKc4zz9j0Ns0PVmVfThYXIUyk5fV9Dpjed
	IMxAIy6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmoGT-0000000G4gS-34Sw;
	Tue, 25 Feb 2025 06:17:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmoE9-0000000G4Cu-36MC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 06:15:34 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2211cd4463cso104548015ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 22:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464133; x=1741068933; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BTJ4YW1E/d8/IwyVSJf2kPq90RY5NP1f2yDnDVRu6go=;
        b=OM33/Q3jWq+Cg3gqZj+tstG0H7iREHNyRn/g+Z2ZTIrHYKJz8Mj+lCvvAb4YZJeG4v
         wG4C8gyo7OyG6BKxe1pBm0naEQGEG/tHJxq35Tg0SrlLGQ5fDA4cTcCUd+3tr1OUw2sK
         BS83BP6D4TmRLzNUMlhltOp7PEGJNGpQCoQ/CngOA12R7wLBhDqdH+oAn5JLMClDhrBz
         w1f4kkCUpbpj74bxWaLE3tFbxTP1kWxzmJ+Yb76kSGonSJGq6l7WIWKZ9NXAfJI/Jm7N
         wSDh31hYuB+Cl5Dxlg6dbFaBjj5NWD6H4CSJi4x2hszI9Yc8e+0qrd9XleD0v+kCs2M8
         xVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464133; x=1741068933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTJ4YW1E/d8/IwyVSJf2kPq90RY5NP1f2yDnDVRu6go=;
        b=o9ar+3QlPhEhZrUDNcxKtfvYcZynKj2dzUVPwae+J1V0ltDIqjcqekp0c4HnAG/mxx
         OwPb5r1EzYWG92zHi0xRyBx6G1ClDldcizCeRQt67gB6t3829TapH5optnj6WLnC3VVZ
         PUsLwct42zsBHSzIePMAgMDmUKYj7ESOhwVCfsjxZ9fHwPf9EiUYNkyNZflBSGxbQbpK
         vCTr2IVg3vlPj2wR6Fq03Gha0O5c8Pln4fmL3vzbwFdG3JlJYaGZOTNbrUKif9Uaefcy
         Qg3eQiWpH8pJXzZ092guzfcd4ff+u9YRlwKS69PrzZYFQ5Io9ircUusQ6nI7zVo9kLAr
         69WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeyg+tadSgCRkqoM8SmMFh2gCPjItAhh7DCzTqkQkT19w6kaFE2Pio1qu+Xb5+vVIwNKc2ceSfVlQ59Lya90mH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4eC8P0Ei1AW7bIPnIK1MMWfjxzHVVMjtslE0kPZYPNOy3xWAm
	SyZ8uRRv5+YasJKZKzTk6ZyA+tDQ3x7u7lFZ3FbCJqTnZWxhKHGG
X-Gm-Gg: ASbGncsh7gOah2TAVR/oYGgcOO7d6u/Yd+gjvxIq39VjHYxvPGg6u8D0pYWSsS2MxPA
	0w3+fjdtnVwXHw0pUTfFEC4qoP8LkgqIMXkujyx8ArGFo7DB1KyQn5ci6ICVUMriB1v/C8LkEeP
	WZEH3WIG+mLy1OCP6BydmXjEuSv0RJAuAcVna5UgagkO1zrHJcMz8m5WKxu2uyNtx1XH1WKz2dw
	8FgfXK1Omz4j+82t389xz7Z0Ej3Pln351fPDWW+wXdo99bwFOdwtd4LVFolUtmNDVeg6zkQf6K8
	EQMylE2j2PrxmNB1/FF77yuQFsQ=
X-Google-Smtp-Source: AGHT+IHDiLECh5yByH1sqMd4J17h9IDxzVERpUbYyDl0rY6eqOShJa0CuOD+3YJm6Gm3L11VgcDmyg==
X-Received: by 2002:a17:902:ec86:b0:220:f151:b668 with SMTP id d9443c01a7336-22307b4c1f5mr33221655ad.20.1740464132903;
        Mon, 24 Feb 2025 22:15:32 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ea22sm687195b3a.138.2025.02.24.22.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:15:32 -0800 (PST)
Date: Mon, 24 Feb 2025 22:15:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH RESEND v6 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z71gAbRi4XRZ-fTb@google.com>
References: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
 <20250217-z2-v6-2-c2115d6e5a8f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-z2-v6-2-c2115d6e5a8f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_221533_773966_BA2D3F07 
X-CRM114-Status: UNSURE (   9.56  )
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

On Mon, Feb 17, 2025 at 12:38:02PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds a driver for Apple touchscreens using the Z2 protocol.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry

