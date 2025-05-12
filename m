Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58C7C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 17:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agBj1Oj+HZoy7ZieZW7PiYBsW88KoSoWswOv+iUWnyQ=; b=ML/xotsoVFbgJvE2booxYWBoPA
	WhSAvRRahE4T36J4xxenbxmVAlfuQHlBdZe54ucjDcK3Gz4S78Smj5HyhgvBZF3UvvCmbC9+epebZ
	qVC77nRC7fRcLFUTgEQ6Q5WZZlaGjqxRzhPtAhbL9I3DWY985AFiwKk7/COAZ/nS4AkucJ8mJpMXf
	A2SDTff2mM+5GiwxWRqrB+9wMK4tRfwnC66BC3yLI1ExtQ09ZPOK69N5qQ7sL1aSfjhpW3AedDoJW
	i5vx2TXuzhJCacxFbtQzgnhKJTzaJEMzkMOYiSgF1GACQ29cp4Fr3m5RYRl8jVkyug0ZQrP7fQtuN
	gVpU/ScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEX9k-0000000AEkM-2dBk;
	Mon, 12 May 2025 17:41:36 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEX6i-0000000AEEo-0wBi;
	Mon, 12 May 2025 17:38:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22e09f57ed4so60285845ad.0;
        Mon, 12 May 2025 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747071507; x=1747676307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agBj1Oj+HZoy7ZieZW7PiYBsW88KoSoWswOv+iUWnyQ=;
        b=GfPO7iurtgIIGCCI6npaeQSGsTFXWNy8YJhHRMEHjqolVczcn5iXFcybh9faJysKvz
         Bcwhkp3Oix/fipvGUwFDwTjXYBU+a1nBa+4ndidYyTkEtN0MgzDM9Se8FvTkxrnkn/+i
         kDkuQtmtYKrElTta0aLS7DYDj9yAFG1fst2P7FlLBrqPuE4JJ88ocxOAxcr2N8rok8Bg
         yqBrsC3lGEDdyRPRMHMHNuX7mHZpX7n02R2w/7+SiFWD7GWD0g7QSejUyjB5xoXku7aT
         RlpaKPK0J/3Afd2vmMttKs67L1RY2gvHEnWqOb0VCicOUysQ3DfN2VEXEYvX3WHFStAE
         wRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747071507; x=1747676307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agBj1Oj+HZoy7ZieZW7PiYBsW88KoSoWswOv+iUWnyQ=;
        b=pWW6T242+WkFNLNFCym4TKmCvvbnz4E12RziDj9zkuC9nHqQVfmX2ZXaOQqETQi+nA
         DDW62W4qyp4WPp1NTOoDXI7cpKRrGIDNwl0wBj4104Sq4fhnAnhCHkWfalHaTqz3nBy6
         8XKA6ogLurV+ejaEzzA/fUTTzONYf6qCxE6Z7ub5bH2gCbEkuXJUkM8Gw0WkQEMSC3gR
         hiqq45nD+7IzuQn5T9EhVuIR7b88aGdokeNtuRAP+h+fwvXxyf6hgMwYvuq8w/cUq8HP
         BmgWBPmc9JpgPr4sEb9EWj8IOkg2CONwW6cSIa731v+VZLBQ+ytKGPHJWVTMI9YQ0bWe
         59SQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7RVGf6H+nYn97PfEcNAbrPmfjI0aUqd1IX2ZqmuKwFaFMTVEtPvTtt53ZTuiTnQ5pB4K/NcTZD41syeV8PaIg@lists.infradead.org, AJvYcCXMUQWOpn/O8q99TWAhWOyRmeoLOFVPoz/pGhF6XW0uYGQ0KXu01UuBw3lExRV2es49WsXrGAIPq+Dwrwt+Wxij7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywce/7PMbGllUfvxkxV/WxrExHk1DVMNNSLqsmzKKUlvdbx0DSK
	Z6JBSh8xCcJNVFfMBJhszjeknY2ydBBNubOgRQNR05kjORzgR9eP/+8yOw==
X-Gm-Gg: ASbGncsGltfzn4l+aZ6OVfcEeSJMFV8PR8i3YiDw9g/Bb9U3hr2OwlVVfMO0bjsINh4
	qSa55nGUdrR5K3JR/+FYR5MZ3QzJip4BE4nSsA1PjaugtX3BcyKMTWO6RVHMtVD+1msqbBmFITL
	syzHtEYXU4Ey3m6dKZWLyDGh6B1MQ0YNTpaQBpEQfSfU7dV7DzW87ka47CBNTHIE2mEsAt8mdUe
	9Js/0QmlTpXkp0055vOCDqhwnrSLnEsELR5IVLFXQoBd22Lr2jx5/rNIwluuUu8wrQzHNxcvD+J
	gaXnOUSk2mfTDn6Y2JV1xse+Z5QqHacJ/WXwiN6CQA59gZMEgoauPWEh5Tbfoeq9
X-Google-Smtp-Source: AGHT+IHQ7QSKHLeCHc3i6ANYoaeCnxFeiKS26unigu1BpiSeyWlgVDCMwVdGWqKDeoN5OkQN+yGMfg==
X-Received: by 2002:a17:903:1252:b0:22e:457d:3989 with SMTP id d9443c01a7336-2317c40892amr5417005ad.0.1747071506647;
        Mon, 12 May 2025 10:38:26 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc773e87csm65912945ad.64.2025.05.12.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 10:38:26 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: lee@kernel.org,
	geert@linux-m68k.org,
	pavel@ucw.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix LED driver
Date: Tue, 13 May 2025 00:38:00 +0700
Message-Id: <20250512173800.6767-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aCGPuKtfprIvwADa@smile.fi.intel.com>
References: <aCGPuKtfprIvwADa@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_103828_262776_1E3B9B60 
X-CRM114-Status: GOOD (  18.99  )
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

On Mon, 12 May 2025 Andy Shevchenko wrote:

> On Sat, May 10, 2025 at 02:48:02PM +0700, Nam Tran wrote:
> > On Thu, 8 May 2025 Lee Jones wrote:
> > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > On Thu, May 8, 2025 at 5:27 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:

...

> > I think setting PWM also same as brightness_set API. However, there are
> > many PWM config for a LED and it is one of other config to make autonomous mode work.
> > Therefore, standard led API can use in some use cases only.
> > 
> > Please see the link below for a better visualization of how to configure the LP5812.
> > https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/
> 
> To me it sounds like you should start from the small steps, i.e. do not
> implement everything at once. And starting point of the 4 RGB LEDs sounds
> the best approach to me. Then, if needed, you can always move on with
> fancy features of this hardware on top of the existing code.

Thanks for the suggestion.
I understand your point and agree that starting with standard LED APIs is the preferred approach.

However, the LP5812 hardware offers more advanced features, and I’d like to support end users all
features as shown in the link: https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/.
It is easy for end user to investigate and use driver.

If I want to keep the current driver interface to meet this expectation, would it be acceptable
to move it to the misc subsystem to better support the hardware?

Best regards,
Nam Tran

