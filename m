Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E683E9B37D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D56P8UfBC6muFJ2DiCU/NOHe2w+/5CdDZNfPlxqtIl4=; b=SPwZ+P2yUy20YfPgJ7uVD+3Owo
	OdvIqODiVduNSb0jmWWtYMDXUtexQFgzUscofY+rIZNKtvNHl4s2W4fCDdh868m954Cb7q4Nn3fss
	jdRRGgidoYzyxIJ4h9npTM9L+4yIa6k5GP+3MkH0hcqfrVEeuSZ71d+Vm/LTyuIPOhr5GwH+lT5hH
	HosC8p/1e/KRQj954CuopEvHRfvmbgmIIxIQnaFPcoN4d69F9wggisEqDIbNvA32qrvFQVdRzPoGV
	Ac2KuZX9xNjuxdvmJRvb4kYU/jB6cKU0Vk3GN3kUY+9e9yu537BIFmSCrAAdxp2ZNJk5lLUgar2p6
	+oe2O/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3Ib-0000000D68U-3yto;
	Mon, 02 Mar 2026 13:27:01 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3IZ-0000000D67b-0Kk6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:27:00 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c7103601c8cso1982916a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 05:26:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772458017; cv=none;
        d=google.com; s=arc-20240605;
        b=MIwPqghYByM4q11vjQUy7WR8FLlRi0WDcjUEwP4ig2kIxfQeLWnqhP2/xh4Kzlawgd
         7Eml9vOuA7jk28uOl4+xRWjW2qJf7zQfA5HyzIzw0vN6laGJRV1IFtHRC3i8W/lFn3v+
         O+2X3O0ZHv1Tewd8F8+7rFCx2d7dwT4zw0Q4mSPxj9zBjAjrrlbfgYLgnQyw+mAhsblE
         /ZxlGdA0rU7h1VK1SeV0GSaqEOQMeuzJZOagVY1Vi4/rNtH6+E93NgLUnxUJjzLm2Zr1
         OQT1jtKuIAAtZUUD/thecdSr6dHEKsRqJiaQTVukMxkmsFti7a0A8EbuTvMgMZInhffk
         7F5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D56P8UfBC6muFJ2DiCU/NOHe2w+/5CdDZNfPlxqtIl4=;
        fh=cvkD8pk+m8YqStHwfaMbD4VlPWfukvnobD3cZb1emo4=;
        b=gB8v2mW6MzfGp40FXJjBwmI0HGCoV06feziF1JcsSx4/r8ZJk34UzcIugRU1ziU+nb
         FtK+LLWYgC81wkmt+i8S3wvndfBY3jg7zt/TrqOjRzcPCgEWn0B4v5u8eZjT383vSnOo
         MBMsh4ICV33Ev0aul+sEUaodDh6/sE5zDAVJNgeViKlETBPAT+lWfNIFydviUAAGCGzF
         qFzI4grLpVf45mn6b0twlP6sP8R4tiT5RK32uJHWXqwcsZnVkxOaDTpZDXQEVXmfFhz4
         MNb/0LfvmQT2j1VdNzE/ROljr6hGBAn9HnH6+R18YTVgTxGVwGmqsWKgVBJV8nnQ+30/
         hzRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772458017; x=1773062817; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D56P8UfBC6muFJ2DiCU/NOHe2w+/5CdDZNfPlxqtIl4=;
        b=eRUrAjZJYlC9kMNXvgPY5yCmHGNTttvAbxAHlEJfnNlIt7XpuSjR9tWdpKzGscZBgc
         /w0VX/lCHoFTLcbRmlz3IjdJLK2o+iYefvhkm2F9/oh+fBo5b2Qc3J7/HAuuP3Zub8SG
         n0OT01VM+301WJT8Pj3caeawlRQwyBt/BV3611SXd0fGV5nXE+r3Qr0CjZo3xttuMiB2
         jo86wD85lYaVmNG+1F6oW8nWtcWbTUypRLCylKpx7oAaSh9/X0zxupuoUCVpSwllrHpo
         WFgnHir5RV3K/wGEazfLcVbnCeh2YVIw6hYmEOYUV3GYsV+X8O18ELcMmp/0/sNpId1u
         0PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772458017; x=1773062817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D56P8UfBC6muFJ2DiCU/NOHe2w+/5CdDZNfPlxqtIl4=;
        b=mgBHjk5edzAEJO3I5EXoFqXkbZamDRIeEi+452cZh4z1z3Y4OcEOa2XUCFlscHWHWQ
         RbgfHuDqkX3H/tYn19f6Qsq1582Q4BJ/bYKRMnHU4xGcJjygf7qs4IYWhADoQsaSA5EV
         UYpjEWpJs7VVoJpkteRpZLzUl1s0XI3niz9xzE5lztjSPkuRGMAAu/iQpBQ+fISai/oD
         DySJXua3+ebsDPlNQbC1V+DCmrrJAE6EHJZsdbYi7AoYyFdZrm0UjiH3xhSLkJgRFJs0
         YlTQsZo4mGdUqaO2A6YVBsl4WyfZpan3lXoLU4CbpauwhqhgSoR3blubaUmoRjzpDQQo
         DK5w==
X-Forwarded-Encrypted: i=1; AJvYcCXNRwjqssQPIHz10xUt8IHO9rIJmH6bv9XzCcNA1MxCmT+y8I7KhyB0a0sRVDDpmqtZTuR5a5i/gdQxwezDRKe/@lists.infradead.org
X-Gm-Message-State: AOJu0YxSpwHsc5DoV0MLgDX1hUuFyymY9i1UFFP9BPiKDh3nV3/5WA4p
	BXdw22LF+G/ArKRc3JdGG2aMZFRcQYDQJv5gJydRK4+0/cnrU0E3d9+waewlBGSg3JSX64HAPJE
	wNvv/RJe7uExavmmLoah7kKN38zICC/F1HHuiW7ZxIg==
X-Gm-Gg: ATEYQzyl+2DtGqw+tXfLYTvsomM+/OQ29pNIOK70+Urr1WECeYGaYVOzjQ13jXfgJCA
	z9aovFH2Qr1ck3FSjYrWniuCYZv8EDPhSZ4thcsgUuOtElwbmBpMRnkLyzIgPdRbVVEFxRtLHij
	4JP3Y5ywGRsmRFXWZ+1PmR24gWpDMxGfXq08j+6ra2cTG7laGRlvnZwVwtGkOe95jDPAJmxm3tU
	Nl1BA3bIfhFsclcUrFCrCbrbxhamn13QhECurnARumT6r9rbmwaC9CAvrGXypHzjjP9P7Z4aK2t
	QMXP8B7GnE+YRcxnykQ=
X-Received: by 2002:a17:90b:574f:b0:356:7b41:d355 with SMTP id
 98e67ed59e1d1-35965c382f1mr8489218a91.1.1772458017387; Mon, 02 Mar 2026
 05:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20260301-bst-v1-1-ddbc22ec3ed9@gmail.com> <6e0e650b-d349-4a9a-9dbd-8244fb050b9e@intel.com>
In-Reply-To: <6e0e650b-d349-4a9a-9dbd-8244fb050b9e@intel.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 2 Mar 2026 21:26:45 +0800
X-Gm-Features: AaiRm53wTBdB7vaC1WD5csl0WHPtUXSPNTJOwfTvcFo3DJQfO2VVg7CWZIHSlUY
Message-ID: <CAN4SLj32y-4BcaAvDhi1VO3ZyrFjezxYfqAn8_DQ2Q1gtzHziA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-bst: Fix memory leak in sdhci_bst_alloc_bounce_buffer()
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ge Gordon <gordon.ge@bst.ai>, 
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Albert Yang <yangzh0906@thundersoft.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_052659_117577_73DCD795 
X-CRM114-Status: UNSURE (   9.21  )
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

> Please use the same expression for the device as the rest of the
> function i.e. change "mmc_dev(host->mmc)" to "mmc_dev(mmc)"
>
Hi Adrian,
I will update it in V2.

Best regards,
Felix

