Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A2FC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 00:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BsxTIcePTgkc+qhqyMPuO3rIwVn2+yc4KgD+VvA3wo=; b=1ZrCvWR50+JlLydCaDxsTcRB4j
	JnjkdElzLhtpQBhb+y6qLkLFtJbd9n27W8raIUiBRT57ECqp1nd43zbuZ+HsTedvmBm0EhfRSslTE
	3p+nH4zlsy9r3CyU7TrabyI9i8hsl+tbHSp1LEEi2cjxkUroeplAr0RFIEzEjgQKqpd5pXbqkY6ZF
	/EZ4bp2cZ+vTeU1ctEK1b+6gqSJMwYz9BH+4d0H0QGOmOxyxcSs7erNRN75POUkc5ZpYUOZtbQ6BV
	M4bpHCVeheq1Y3fk1fYczsitsm2oBlq5gyiVjZQ/Rn5i0PTd1bwpqnl2mbzgvfF4NjDrijFQ4D9J5
	3ft6LB0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuJbS-0000000HDPS-2daw;
	Thu, 13 Aug 2026 00:47:26 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuJbP-0000000HDOi-3wkd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 00:47:25 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1464200a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 17:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786582042; x=1787186842; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9BsxTIcePTgkc+qhqyMPuO3rIwVn2+yc4KgD+VvA3wo=;
        b=WN60Y06hjVq6ckfiT3k0Hd7fC/R+IpKebXROATxiRZCgeK9sY8/iDfQ4JL/eMpv+qp
         vy8/wpcCgwLFJuiRcym313Yj/2qUthJHnAPkENGUeZvmXTe5YXikKax6RKb2M2XphRcx
         jp7H0IDCJKUtWyurOV8ifd2VDOFY/6N4APCcCchJlEAt4erwsO5BYUo/M/JOVaG1r6Ds
         9p0qTOzil4cOVMVcHYIhRx+eA8ynvWi+5TdkAOH+4XSlaRwIfa5as7hmeZSOgUaSiN4O
         54MLT9PKuXT5k+Tky//GPzIWJy9gnsI9hDYF+EnjgFUZ+S/LUE/x0Yyei1c2kKEnA/VA
         ickA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786582042; x=1787186842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BsxTIcePTgkc+qhqyMPuO3rIwVn2+yc4KgD+VvA3wo=;
        b=r5FYOvIbggfC3iyw1EZqLE9NKZ4NuJZGzbmVs+xUf3+R9AjTezaynZ3VY9JbWjLKmC
         64JMj4pB7+fqB/LlOpD+Mln9mi79d5xeUsREk25uZCkz7nXLXb2euf+9Pl6Aw/NK4yPP
         sO5T5Enpp2eO2Xs7pCKX+cNs+bkAV39R5uk69h6SAGhvFMqeRitm9mqiR3iyTxkdvjDj
         FoSvG61eXxYzCFtbyYc2bakVVja+DIa+Sic3ZUF0023NLsV84EqFl6QeKXz8ep/5SE/S
         jWk1maIH76UMD6FCc6ZVywvELFVXM50Zp1y+Nj1KJWuvkfsnSz0Ah7f1VDFRaNReiLPA
         iRIg==
X-Forwarded-Encrypted: i=1; AHgh+RqHjQNGVUxpndeypNSEY9BSIqTKud8bJrRS3WaHBJWjSSBBcoH463DapCfd24yVSYmtmMHha8EWNkjv249OWPMV@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ+R7ethT5sniEheTKsrWYYv1oMoWNIUDD9MfsrHEd5zJ1FTFM
	ISQaGzu8d9wFpueki0zd4BOATOcmFuMFAAehKx4RhfQp48R7BhRvx6Mn
X-Gm-Gg: AR+sD13ZK7gcE6RrY7k+bHBto/D7wkCvubsbqwoVQfd8znUfkBJ6DOUHIY78g/ZCwG7
	h1kPkZDh9S6NGQN1pBNdCcsMjmrWwYuEBjRho7j6ppAxJ/Qqqz5YsCuVsPycYVp/UYJSG5ZkXS/
	kLViRucF0bQSW6aaKxEkfPLLZbxNg17kqiKzooyFUTDUga6nzLoC2ZoCXvn1/IHAhMmcU9vqZDb
	aIqCjRXqikqHAMTqVOPSBMK5JQcENQBdfPZnotmWwbdJarA5nTTR5PgTaqRkbeJAEVIfGNcCwqh
	NE22P7SxVowL5CIFVNRgaHRUSjn3wRY9AJtJrRwhtEu8oTaEL59Pc91IurWGyqEjukEq/lE+lp3
	00nHcW0nL+4vFBlUYC4NqKGgKRz4zeo9bRUkwqoBOh435kk2Uhxs6dhngOqiNcZfYeWu8LuBK4a
	xuKizIW8qTD4hjibdi6i/VecBqi8JCLfWGzAbZXjmavFocFVcTz3p+5iNoQwrhC0jQ5WScCoujL
	8tvpr3Bwn0AUYpxHKft7tqr7vxWBg==
X-Received: by 2002:a17:90b:4b92:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-3931e079c22mr1944443a91.6.1786582042327;
        Wed, 12 Aug 2026 17:47:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:8656:b5a6:1038:61b9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf732166sm1762331eec.18.2026.08.12.17.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 17:47:21 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:47:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 2/9] Input: elan_i2c - sort include statements
Message-ID: <an0UEY6gigYTWFLW@google.com>
References: <20260811122011.3539250-1-wenst@chromium.org>
 <20260811122011.3539250-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811122011.3539250-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_174723_983525_72E373EC 
X-CRM114-Status: GOOD (  10.65  )
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

On Tue, Aug 11, 2026 at 08:20:02PM +0800, Chen-Yu Tsai wrote:
> Sort the include statements before adding new ones in the next change.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied, thank you.

-- 
Dmitry

