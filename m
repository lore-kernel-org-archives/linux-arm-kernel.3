Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEA7C3ABBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bk2Fdh/LRuqCw+jHA02dwhIjxA4SW793iNQ+swnOfo0=; b=T0d9DRFcBjhGOviFBte8VhcgvT
	H2VXO3pxN6VLalk0i2poVByyPEztbDDyfSfc7h0/0IkW2CgNdL5+uD2Ct3aHFw52LuO+sYws4FAdN
	bFLC44eYoIDCWobpkBvi5i9qSDkEwsIx+CvXbhWu2AvygUx2MwGr806LIERXyG+166BuHr4weld6P
	klLxgRKP6GQaF5XZM6PWCQ3U07FjzErH+gdlJXTl9aOKKOamay7OUzhJx9MuNDjNjwZ2pg48JNeTu
	sXqUSeB1DhkLl5PkNfQvuJzoOTGJ5/aOoCeyXQywoov3/e0+N7D8nA9/mVlM0WovsoiWA14C2B9/Z
	Ciafm/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkn-00000007S7Q-3dKw;
	Mon, 05 May 2025 13:21:05 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvaM-00000007QuZ-17X1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 13:10:19 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54e816aeca6so5535468e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746450616; x=1747055416; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk2Fdh/LRuqCw+jHA02dwhIjxA4SW793iNQ+swnOfo0=;
        b=djHntaupA0bNjGp3/iPaQGlEjToTQLU3LcyS4xiWTz4SS5G7CMCWTHjqln1XGYTWyN
         rZp4WYVPdlM74QdUbMmjsBAVXlHmIxMx662b5FHMXXLcV4/RU8MDSmCmpZuiDPmWReUB
         rozIsPelfa6Vvb8GcNMfEBrHNn0jXP9yACn8SSX3GRLB9YdHGQ3i/yLPCfHCQFV4auSs
         RboeelCbabdJMaB5JbimJ6RG6Qb+u8U+5G9OjLqIQl1+mtZxNgdVhj4bo8TE6L+iE6vn
         WWql4/Nc5En6hz4ihlqLTbMEn/hdEk1AGW8CRo1d2AY/IDgxo8ysmFu5DMEfu2HQ7i8P
         ofKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450616; x=1747055416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bk2Fdh/LRuqCw+jHA02dwhIjxA4SW793iNQ+swnOfo0=;
        b=JHryExJbhvRpHBFNTZpf8HloGLojAsSn80TfpJ3qBTdiXeNpM2UgPwmBX7lTiNqo9C
         S73w2ZOdymOzdpOm1CCwlPLJM3Ho+Clxo9utx9f6aMEd1cvnGx7PlATRTKDCLP9aC3qR
         Ot5YU3bd0khESwO7hd8KHmomLt9xYfazdrL/GWGMRj3wDhwdFvV7XNIR6N7wjgDaaoiD
         hLKymde0sszKWqZSwI8qZD0PSCqgR8bBpcO1ZWBUr226c3SGwAlAvxT0CjavCAqVn0X/
         yB6G57ZQeJ8w5JoFgBlQoaqVmUfuiCNp05V94ZKBn3l9vz0pWI8G5196SSbitGqgrPvr
         fkkg==
X-Gm-Message-State: AOJu0Yw72WEbeoEOZhipCvkW3fS7APRbZJDksibi8aENdAqV4tExF+9b
	ug+2QvQRnl7ZLLxoUyFPBcd/WbSthG0oVgrTSus8le7EDy9Zz1Af
X-Gm-Gg: ASbGncup1KmlTWdy9jZE6U4oOFef6cANKO4xOjCBAypbUS6yu51MPSDVWXe9aHmgwL6
	LURl+J3D1vAdxCN+iEOvCnJYINNN48XFQfkE5PABTz8EOGaQK+WUOrrnUrZBew7+12UWqq4R80F
	xHSx13XQRzpsNhVEz4xkclCUCBamJk1cF5klUfe7JNnosTvsKv7dDeeDmYC0TSHb8Sz0+w2T9gz
	+b8DlwiBmQIq3qPqSjlvixc4Sat+TARaJorX0lD156s97a3hl622nLViW3msagpWw1+2Ii4A6SC
	jVvYFHHx+jVrCIjQGbFm0FEQKV5a7gsDlKlOsPmv0izcOAJOJo3pYL2OqON5fKH6kY0WXw1OGbc
	rRw==
X-Google-Smtp-Source: AGHT+IHr1P+DfBvNYTE1IUuk4mUjXsCsLwslNxXJENXtYrYYMvnH/fcJseObHYrApDHjE4l45mPtNg==
X-Received: by 2002:a05:6512:1596:b0:545:3dd:aa69 with SMTP id 2adb3069b0e04-54eb2466eb8mr1961754e87.36.1746450615513;
        Mon, 05 May 2025 06:10:15 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6e0bsm1703046e87.252.2025.05.05.06.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 06:10:13 -0700 (PDT)
Date: Mon, 5 May 2025 15:10:12 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: davinci: add I2C_FUNC_PROTOCOL_MANGLING to feature
 list
Message-ID: <aBi4tE4IQxoh7jYL@gmail.com>
References: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-i2c-v1-1-82409ebe9f2b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_061018_306299_2C633EC8 
X-CRM114-Status: GOOD (  10.83  )
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

Hello,

On Wed, Mar 26, 2025 at 03:39:47PM +0100, Marcus Folkesson wrote:
> The driver do support I2C_M_IGNORE_NAK, so add
> I2C_FUNC_PROTOCOL_MANGLING to the feature list.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Is this patch picked up by any tree?
No confirmation nor showing up in -next makes me wonder.

Thanks,
Marcus Folkesson

