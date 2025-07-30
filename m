Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30203C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 22:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNHleuSifX4SpZEBGO13RG2Nv3EISS0eVP1Y9ZTvpOg=; b=2KSoKwSqJYroBGovhL7PqykzLo
	TMvpMEuJ7OxNs5qqFFrQ+f19GimKjNbIEq4ySvoh8tt0FuON8VCPTfwfP3aY7b4cLKhgCzB7ihk3w
	GgKz4QcJO9rEWMva8DwwFcq3xX4ZUrooMd+v6elPekFTwb6A6s3N55t8OQVqogntzhPcWFqmxLjTf
	2IrdNcC6Sw0+P4lU3uzvHWYbQmd+Tdw8/RrWnGQPt6rU2kBnJUhJTs2xi2zXzytPbf4NbVkWUcVlP
	+Kh5pDtLkXmIA/zwt3rvvd1ud2W552AYuWp0s+JTsfsAzHuRitG6Dn6Qq+YLInPRCTXclir9YidSC
	hlFCgz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhF2J-00000002YGP-0lVW;
	Wed, 30 Jul 2025 22:12:35 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhEzo-00000002Y6P-3Gr9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 22:10:02 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76b0724d64bso276885b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753913399; x=1754518199; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNHleuSifX4SpZEBGO13RG2Nv3EISS0eVP1Y9ZTvpOg=;
        b=FZjMGzHKjaXdSRpmQfmfGEMxDVL99oXNEAa/NkejFazN8GZeu8aU1Xh/oOd6h2Rxea
         2orekI1y7MsOpcfzEnKDS+DxMBnilGZCfnKuFNT40RTX20oV9DS2B9I61LQbCCQMMSsw
         /n6z+A0rsf7B7LBZsSeZFohHXFUFGIG7SBUMbFasrSszs3cfk3hS2byEJxnkRzVU/iE/
         kp/+vvKDMsEscx1DODV9OBlRQs90JDJgzzPAtFqAde2unAzsXqQK7ZgzdihR8n3qqvi5
         8P4TIL12gcdAjzbVGmXjkREpWa/vmR21Iivz34EaUuoFn1gNbmCJ570L9cURP6fweJpI
         +qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753913399; x=1754518199;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNHleuSifX4SpZEBGO13RG2Nv3EISS0eVP1Y9ZTvpOg=;
        b=ihc3ZzeUZ+hG/ymUkv8IG1RSqIdOsMrIzdMLdm461QD0qK5vJZXJ+0REzG7p9Gep+s
         CWO+hh+cb1LFtB3ITrFcQcigzGWvx+0lRkF2icGyoslEbvmeHx1aItioawGmmui28Puy
         htaxuEYJX++y4/UXxB2Rr/mfHng0GUEf9eVnuZuVu9SIAMgDEeeIbpx5lqIP0RH0KxyO
         GaiPd9TIAs6Eb7M1ATto7KMkwhadyUZY5rDia5vhBQbHqMjSEhOORmKdGwFA/hwKA45+
         YB7aa6d1zleQNZY3Zm8P90zFWIka8avoGS9TFptu3psxkGsrInPftcNRRUJPnxHFz8cd
         zydg==
X-Forwarded-Encrypted: i=1; AJvYcCU+85y/MLOtwR0gu2iz2elPJwCO+8m2nfUk5WRInUc5Zph0XAayCswCIyM91r3WYo3wqERqTdv++/1G6dm6oySF@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ8RGn5ySYqrpSMoy9Z9PuaJjU+iIaTihObYNwvPhVbAc1/KYj
	vDVRxf8dOm/KcgUhrBVli1mJ5NmJMumYgsz8jtAkp1e05FJvMZftdLjgp2MuYDD6sh3IV76zRAM
	ZLRpXIB8=
X-Gm-Gg: ASbGncvE9ntcUWkg09hhMLevUvBNFPR2C04mVtqOpm/qipWgYeVllqwHIA8pNxy1tx8
	8W407n+3Nk6TwWS+W2imOC6eODuxHfTsJ/fgk/NcWQRk9mEj8BTJdL14EGw79I1veL+/9XXnh64
	6Iy9cDkIfqq+5KJlSy9o0ObpPw8Wr7zhV6ZqwrmNdK+RV0LvZIghsgVAF9T+H8SoK4WWkeGkyEn
	BRcqLHpQXH96YS9aoLnqk6QxmyVvKXYVNlkSDn1gzuoRzp8uy3/AKGxwIaUWCr5XSW5iAgvERP4
	W4mAWu2T1W7D/uUFZyp9i9R+FD7DnyMCBxzDLQl/75RCWoH+L5S99W1vPCSAm7ROtb7m7O9J+rS
	PH9LGllIb1tIkxIq9c+TL
X-Google-Smtp-Source: AGHT+IG2Jmy1RxV6oBn2xGkRgnttbrjqStwBdj8OoNSVMvlZtpFrHbZ+yOlxDoOXh/Si7e4z6KNvHw==
X-Received: by 2002:a05:6300:8054:b0:23d:c9d4:8634 with SMTP id adf61e73a8af0-23dc9d49682mr4388168637.16.1753913399278;
        Wed, 30 Jul 2025 15:09:59 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bb18834sm42944a12.64.2025.07.30.15.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 15:09:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] soc: OMAP updates for v6.17
In-Reply-To: <42241d2a-bf66-4ef0-a083-b0d4f0c3f9b2@app.fastmail.com>
References: <7h34b4xcxb.fsf@baylibre.com>
 <42241d2a-bf66-4ef0-a083-b0d4f0c3f9b2@app.fastmail.com>
Date: Wed, 30 Jul 2025 15:09:58 -0700
Message-ID: <7hwm7pbaa1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_151001_059083_CD595D09 
X-CRM114-Status: UNSURE (   9.82  )
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

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Thu, Jul 10, 2025, at 17:50, Kevin Hilman wrote:
>> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
>>
>> ----------------------------------------------------------------
>> Kory Maincent (2):
>>       arm: omap2plus_defconfig: Enable TPS65219 regulator
>>       arm: multi_v7_defconfig: Enable TPS65219 regulator
>>
>> Li Jun (1):
>>       bus: del unnecessary init var
>
> Unfortunately these are changes that I really want in separate
> branches, for defconfig and drivers respectively.

OK, noted for the future.

> Since all three changes are trivial, I ended up cherry-picking
> the commits to where I want them. I hope that's ok with you,
> let me know if you need the stable commit IDs.

Yes, fine with me.  Thanks for the update.

Kevin

