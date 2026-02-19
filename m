Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6017E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79yWENIeJiOI8eu1NM831bIc+LOdWu9bx+B4L/t5N4I=; b=Nudjao1wdXx/gO1WM1/WaOMx5Y
	Ay3NzEwvHD5J+hcg16Q1g+WevSq0th0Lz1HRN0FQIIyYxpd4WjDN1g+ichBnNpbHl9W+XEdM6+hJF
	XnUesWB4SPbqZBQkVKjGSvQ85KEIhWuCmnQqdK15YxvVifxBq35iEsw06p1xlQjRSPU6369vYHZYn
	kXbbd7YoDeAtZCwTYyHfnAtWMd6Do4UERSL1Mht8JxDRf0+BcR/0m0nj35kdB7BJguU+55iF77zEd
	fpnWXR+bhGOaYNjY1rdBG9Sk8Xtfz2/7f2+6muy5Q9rEiu9rjfPx5azjertJY8QEY1JlBhVb8KEl0
	CwwuBqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3my-0000000BNgm-2iZB;
	Thu, 19 Feb 2026 13:09:52 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3mv-0000000BNgN-1YAq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 13:09:50 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-35621da1a7dso602857a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 05:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771506588; x=1772111388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79yWENIeJiOI8eu1NM831bIc+LOdWu9bx+B4L/t5N4I=;
        b=bjFOwMnFlFZj6ivcbda4YYpH2ifKc9IiCNni0M8plbld1zHzIK1O2U0rweGVyPAe4k
         +aH8b5WJUV+/4jayfK9MwTUhmz/svbaFTVEn2FFKrnYIwucU3fuJGfXfjcRSR/ectBLm
         aS8EQxQcoIVjhOoiLuqdbCu+YU1SSZqtIdOCAKE78yqbY49ZdJIkDDjQcjvB5/H+h0Oi
         rINonYtsmJqKABnwCvaZhFbrrj+h+U29Lnioxla6PBqbBUvfmXz/1UQ4DhlafNaYkwcs
         U3M1kQdDB3yD/Q1N+RFbO9qExFq6n+9euFQb97U4VCUzf0UybgeqfLbDd/R4HTXND8gn
         uCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771506588; x=1772111388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79yWENIeJiOI8eu1NM831bIc+LOdWu9bx+B4L/t5N4I=;
        b=c2gf7tV9zuz4ImvouKd+vmlWetPSw/omfAAzplUuEa/NpIJDz+pEAXp7rf0ksaspTO
         Yq6yRqmv5nYusn5Rd2ErR/xvtJEGNFiLKUQtAohcsHM4lYfDRO9iw7c2zpxXwVY+Imzo
         ZqSGdc9zJuMs32Jx8b43GVu+rJFKmkIUJ+3nXd4KfJPZSX0BkXN+DjenPfRpVZZxcpJ0
         fqE0ReMam4ieK70UFmrqo4/WVy9TRqmOYN3gghbp1xrNvMkVGMlljk84BhZope5BXiBz
         kubHtI//9iR2c+R1B26SsEk3gQFxaDKsCmw5rZpEAR1aJR6kP3aJ+NOrp37IbbYniPx+
         9JMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb+v4ILfBd1bObNfjVXSO7juf6lQx9+Zw3bxmC7zlSLePQWi6YQk1eRy5EIXP00LDo4P+r7mcas3Sgvv45v4Dm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Fa2DbbSsgh4As6nekvQvrEtuyDSgKFMxurSZTxr3zvv4ggZP
	zVyPoYqPpQvzBQV+QCeBfVNPhbTrCHxQYRFio87MTCHhZZ2e0jvBZy/P
X-Gm-Gg: AZuq6aLp6QuRuCEFFVAJ1IRKJ5YEmm9uM7wkxsj/PPdKxLZCAR1i1nIsAhsIvyczuQ7
	P30nP78nOmN0rWdaAMAihk16dFrg8b1BkeB7eWG6SWoveMQn11SAu5rxf0GskONBgaoBnjD/pgS
	4bcXgnHkFvA8XKZFIZlI9qoPWBnGAj8SBveuPk6dpClJ7XtPCd9eeQLXCR7AEb0dC7hmv5qu/1b
	cfjTHjSENyIDD5WR6bEzyWgHYmLa98x5UgzxD0eqV6dQa2w90FlGSi6OIVXZAC90HjeJ5vmZgGi
	HxdjYWGxlOr+FxtF+KshhPNjsAG7/1Abv4gkNK7cfW1cq95UaXhNclEvLCAgwSg4D/BLDq/pt1D
	1fMjbwAtH09xNPQP3OnSqqkHc+Ek4wQUC8MUAsKHjJnQgQBnDfpwsSo8FgXb7rl2fk/gu6CuAxQ
	GNJYLf9bCQJy/odv8+4tXzIla2CypH1UTfuusXmVLfy/G1cmCAt9b67pD+x/zW5Kq0d1wjtWS9w
	vInX2YTf8izWluI0aSvjB/1J7LvPv/tjBHsGiBsCbTgUxay+hhV/dPsjZv6aLBG4Br7jw/I1FZy
	rY8FwmAgGuPS5w==
X-Received: by 2002:a17:90b:5704:b0:356:4c1f:98d4 with SMTP id 98e67ed59e1d1-358890dda32mr4625746a91.13.1771506587903;
        Thu, 19 Feb 2026 05:09:47 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35896ee223dsm1319001a91.2.2026.02.19.05.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 05:09:47 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Tejun Heo <tj@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Vinod Koul <vkoul@kernel.org>,
 Pat Somaru <patso@likewhatevs.io>
Cc: Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pat Somaru <patso@likewhatevs.io>,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] dma: apple-admac: Convert from tasklet to BH workqueue
Date: Thu, 19 Feb 2026 23:09:41 +1000
Message-ID: <6224644.DvuYhMxLoT@minako>
In-Reply-To: <20260206221143.1261191-1-patso@likewhatevs.io>
References: <20260206221143.1261191-1-patso@likewhatevs.io>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_050949_443648_066F4C5F 
X-CRM114-Status: UNSURE (   6.28  )
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

Hi all,

On Saturday, 7 February 2026 8:11:43=E2=80=AFam Australian Eastern Standard=
 Time Pat=20
Somaru wrote:
> Convert apple-admac.c from tasklet to BH workqueue

Tested-by: James Calligeros <jcalligeros99@gmail.com>

Regards,
James



