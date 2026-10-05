Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602B9CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 12:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/Ouz9WloeKvUHxr+IWiDIKxmL82mM4htq+/IQDKXxk=; b=gQTQMZt808VCbT4vnGXWPLffYC
	pNS0ZhFR6Uqvk8zlLgVwvzjRNvd5oL6nXVOQeznZTEnP7Le/++Ag+Q7u8E36vtfyB22R0RYYsaWgt
	WZJNyC0ZMG0unJzPLEWay/t91Bdpb0RpQdUBKN93txTFM+zJ0YKznMDdQtplcjIwHwhDU8eTyPz++
	DHkHM+hnsFJpw86OBh6/oseG5gDv4PbFTgcu0sTvRVcvlpwC1z7Sm5BCVsytG1zYTfhAX9O5r7sdV
	8IcOPeODam1eSAbp7mOEp/bU2nA/59Ym57s7teGXKYWPKh9WcdEKO4MvmiFnRBWVbxwOa5DPW4O8f
	R2trXzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiFR-0000000GR56-1vgl;
	Mon, 05 Oct 2026 12:56:53 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDiFP-0000000GR4Z-0CkR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 12:56:52 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a0280d4f56so10612095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 05:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791205009; x=1791809809; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W/Ouz9WloeKvUHxr+IWiDIKxmL82mM4htq+/IQDKXxk=;
        b=Vunuuqqt55q5XZv8vvvu5XxEZflU1/lJIox4ZBzAe7MT4o+2kqRkQ/NaN6QC/UL6kS
         iSJUXeCWS729faCddplFFjHnNcxF4m5+qbsviz7hm2kENmWJDbz7qVL3lNjiRMeBpkFP
         MoF0NQCTm2GzoXz5aqkF6WBB4v+f+zRYt0Py7WYhpof3v5F1FdD5UwzZG8Qefs/hCsII
         +q+3zCf70iFSpAZ9Gz2IRvG9QcLwlltl23u74nTn5eoch+lES9YkHlj+RFCsyiEMWKG5
         XsaipfaGXE0xfW44h9dHhKrPPxTd+/JjZ0idSEv0gNYX6srUljVuKFQXAiJfuCcBI2d3
         w6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791205009; x=1791809809;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W/Ouz9WloeKvUHxr+IWiDIKxmL82mM4htq+/IQDKXxk=;
        b=DI0XMhwC8v8Q6VnvjANFVCFultRzSrqs94MWqZI9Q64z8tVZ76VHvFRNzE2UJAgyzG
         zbXZBX17od+PSAO0QAsA/KGP7HTbgRg9zM/cbZjemPWz3QAMCPttm8aa2KLuV2m+k3pQ
         ZkLslww3EjA0ldrmlhUDTLGD6kwbZ3B2K9/GlnyB7EKFFoz/PAKWDYK8q9Ujz49HvV7m
         +uOhqDkAe/Oo5OFUd8s1qY6mFgYCwqqhFRbNiTKeO2J1tgg5rS3eJTtcVGm3SqCN+BBn
         O5G+GUcsJSsQtmm/zPVCZhwXaZlhZKbak+OQLY8GXwCLQv2lqHBy2WvtlQc7eV+pdyFd
         /OeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1S/oTk7LhCHfhuIV0WulFprZPy5c8fzYRW0Apu+ugacv1gpbZvuHS518YNsDUoTSpJCuqiffm5XcXQ2lqnepf@lists.infradead.org
X-Gm-Message-State: AFuF++kHzBlXsMpgBqUQCKh2zc1p7/1ionZSsLQYINTRua8256maFPRC
	i9fQa8y4QrtS3vV0rS5ovpGA0tUiK5GNL2k2KAbWGwETCY3mRR6mXMlO+Wwohw==
X-Gm-Gg: AYBFou1P2AqsPA4LWf2np3ZO0eJWAfuVG4VoIryfC6XEdL+EyQagxKYEyqNSXWnoCE2
	hs77DQnfrBMZ9LmiGGQJYVX+HEW0rCxYGMI+bcLxP9Sx4AE0WkQpmqg7f4ZgUZwU3eHTh8xx+cb
	NrxXhpHmAiueoIgeGSxuJ9I3E/wz+k4gL4qxks4UvNemmYFQKpg1UemBjJBOaadLGnx/nSh2VDx
	O2lwT1VE4nsVojeplu40JyUytSN5mUmSk0qiRG3D5y5gXlof0u/Afx2cA1KsnmPjbsg8nv3kxQY
	1/9Ttt2QwJ542yfr2LAHQo820Dfo4cA3MEOPX3PW+0jv0tj0Rhm0SC5IvjrSXOUJNPy9Mmj5+oB
	z1klnkr5fB+Pc+Wu85MAoD0ZB19AxOLysEbSgsCJBHutQ+PDCw0D4E/0dH+1t1ZoSWB9vc7qxzj
	GrRAP7Lc1CxgACCTTINhVbtQF7KN0S3if0A4FjX+OL3w8ASlecMujitxb5/ERyT4t/hpgin/8t/
	f+ZvtOLKutU5//SBLhTicutEfEobGEs52zP1wO/OOGdTVACDaoKzJniYEy/meeg+/DS36o8Q7x1
	pLrBDFLQfLBnH4yqRkHzgkI7zN8KLfrJ9QroCrpkwBXBYeHyho9XoPFCM0uz1SdE2WoqpdlF2Hh
	eEuP2YlgzVdR7iszVTPPAcg5FUnmEbj7J8HAbpD2FJvWfxQ8pdKFe923y4k1IMGrMibXbKtiwRC
	7wQPxv
X-Received: by 2002:a05:600c:474e:b0:4a0:1bf4:edbd with SMTP id 5b1f17b1804b1-4a027573d30mr166221905e9.5.1791205008939;
        Mon, 05 Oct 2026 05:56:48 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622704c1sm2895736f8f.10.2026.10.05.05.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:56:48 -0700 (PDT)
Date: Mon, 5 Oct 2026 14:56:45 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Conall O'Griofa <conall.ogriofa@amd.com>, <linux-iio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@amd.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v4 09/15] iio: adc: xilinx-xadc: Drop unused header
 files
Message-ID: <20261005145645.0000170f@gmail.com>
In-Reply-To: <20261005094205.1045874-10-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
	<20261005094205.1045874-10-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_055651_102108_238BAEFA 
X-CRM114-Status: UNSURE (   8.01  )
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

On Mon, 5 Oct 2026 15:11:59 +0530
Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com> wrote:

> Remove header files that are no longer required after the
> recent code cleanups.

A bit of a misleading commit message since you're also adding new
includes as well.

-- 
Kind regards,
Joshua Crofts

