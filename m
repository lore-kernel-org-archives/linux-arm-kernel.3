Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77457D6EBE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 07:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MILLxUu9rzLsxKaeqYpm+2Gulr4Avp7+0QuruaQfahA=; b=1lVj9JSIcIgbrP7rLqUgHEdG0V
	WxcMx9TvMw261gm/AtCSmdsQILOzOkKC8j79N519mzj0lbz3YFaz4U7tsnthKLPyQgmYw3+gVL+A3
	2RiZqHGQ4FaHgS+rpG7cxzwqaOaz+KtR0Os8AsxObTBDMQTdyt5sA31HHigkq/BVrUL/zhANnWtiH
	Zac3fSTlxKw/en0uY8fce/WtQADcm4pyiPUIlqKkPtv9EJIgSiAzvhRfzbgHWiMLkCFnjPuH1SRv6
	BWD5CJ0De4ozU6YHqIfnLSOwkVkCHThEiId+bCPlVbKht5QyIG4iwtaqXqDKJg8v7ltwIvPgqOniC
	gBFw87fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGvqL-0000000H6kJ-0d3C;
	Fri, 29 Nov 2024 07:55:13 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGvpL-0000000H6c8-1PY7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 07:54:12 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e38b2d868c8so1423166276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 23:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732866849; x=1733471649; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MILLxUu9rzLsxKaeqYpm+2Gulr4Avp7+0QuruaQfahA=;
        b=gnvpGgwZQLe+FFvV+wUA5Y2bHn6inJgDymSG217yRVdgx8MJP7cT1SYE9GjvHLETLC
         vwk36Vh++vc0go9kTSipMA5+t2s6OXxv4OjtVLvi9TonrtzCAK2kJYhmCZFsC+NsrwuN
         lEYNQg4CsR+G61Q+0HucVgiPJDXkes/XLTZs8uiXavvdl37BRiDPUzfE5QhnmOwbsMsS
         GU3z7GRXJFDqqozLtFFZCiDAV9y4m919JZG3B443P/diJi+sR+WZk1OQl00ds+aGhiea
         tTmhU7R+7Q1FGYeDchsSLfj9cVzKOPySnwY55EH7/VYdYF3RK49xphVU5VIc0cp6uvq8
         MhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732866849; x=1733471649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MILLxUu9rzLsxKaeqYpm+2Gulr4Avp7+0QuruaQfahA=;
        b=mU7wyhL9zNpMLjQVJMK9x4XplVUHq/MHR6Mt9JRJedbKw9TqOXUvvu13dAatALwd5G
         FVkdU8/sIIolGIwIHCrZMmdP+6Nzw7SbWnx/196DHFzR1NheslSEyBsRuJvyrPbwCDyp
         q1v6+/sjkS9qvrWmRW8X2M2nkIH5z5mIo3WAiaiDg9CLSiu5Ak8aBHDQE6sXiZGOkJyC
         xmWbjKkPruMz1SQgGdO30fu4Vsd6cFTfO/2V/lkW/U1nc6HEeXqDlmM6LH1kQJbJC+kW
         gFZh78nKcZJK56PBeL8huvJfdNzjUSJZg9zkq7p41EDssG7L5bl6RwfoCtW8ucchFD7I
         kXuw==
X-Forwarded-Encrypted: i=1; AJvYcCVW3bh2RliJpHF9t6dJw0jTMxacecgIu7AqymBDRp0dKXduZQ4Sy4Iymfsg/rAizmpz65SqLQ3mEOVU6oFRyRPt@lists.infradead.org
X-Gm-Message-State: AOJu0YzQQhcO8m/XUuHHCVTISCLJ7hFcgNlO3OJ1JYm+E+KCXsrkimNQ
	dEf0FFJu/jHD6Gj3wduPhlM/DBqKTQ3pBO87YhPTqufYNuTzXcsuCvAcyyECl5+rbLtQPjMopjE
	aOfQyq3oQ3A7kCJrGcr+0Frdc5lY=
X-Gm-Gg: ASbGncvJ1hQoFfLZSjmcW1l+EzmPJkClO/to766uTu0VoPbBq1rpa0X9dOkdbgV8aOG
	nNnkhvHFg6PK6+WfJDf8eUDwAEFLStr76
X-Google-Smtp-Source: AGHT+IF8HFusBVWylrBABsLEcXExgX39TFtK9CKcRntzgb2j/Eixg3DOFVeP3pBNmvcd13VUQ6ALY6h5mUnCdbvtq3I=
X-Received: by 2002:a05:6902:114c:b0:e39:772b:4bc0 with SMTP id
 3f1490d57ef6-e39772b4fc5mr5024271276.42.1732866849543; Thu, 28 Nov 2024
 23:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com> <20241128-z2-v2-1-76cc59bbf117@gmail.com>
 <abmpkfnfrbcarqhp7pspxmy4veuiavpy2p5zqe5ljkstveuuzz@ur7grz3zd7xx>
In-Reply-To: <abmpkfnfrbcarqhp7pspxmy4veuiavpy2p5zqe5ljkstveuuzz@ur7grz3zd7xx>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 29 Nov 2024 08:53:58 +0100
Message-ID: <CAMT+MTTRT+z2i6qrqVo-KVNuPF2o2OV5HpfhbXiAaWU0TBr-WA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: input: touchscreen: Add Z2 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_235411_432573_4C506B52 
X-CRM114-Status: UNSURE (   9.72  )
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

On Fri, 29 Nov 2024 at 08:16, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +    description:
> > +      Calibration blob supplied by the bootloader
>
> What is the expected size? Fixed size or maximum?

Unspecified, 1688 bytes on my machine, but the firmware
has a size field. Most likely less than 4k.

> Add it to the example.

That seems counterproductive - it is a ~1.5kb blob,
and it is supposed to be set by the bootloader, not
by person writing the dts.

