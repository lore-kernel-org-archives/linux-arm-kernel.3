Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D971BC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRvwnXHVy/jqUCw/PL8fHu/IurmtPlulBPvKYqgBdWo=; b=jQVpD11OnTET7eZSv5cqJMpnNr
	tyCLsNPiZy3wnUlirIx2TtyaYFzD0fk44KTUy88kjD1AzQi79gUqwgaaIjwuQMuRsundavwvQYV+d
	jhrG/gvvjQM8PhrLDKz7GcDv9jATFAvtUGT3Z5ME7J6lrz340HutGqZuhJ0i2qNd2cLOmF6yYvgyw
	L3q3z2/iJ6D5CL0vBmL1A2+59OINLPqQqpHZn5M8DcoM/b9QSFyO/tHhCiC97DfOzmeP9JS0xHlPg
	NCtKG8g1pkqdNcAgBrgXcKLm7MVyrIu5GfJtuhAq0KTaCzqmc38bKVi5xJCtWaMpviQ5+7cE3/bf6
	PPyudOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22y7-0000000GonT-0uJj;
	Thu, 03 Sep 2026 08:38:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22y4-0000000GomL-3lzk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 08:38:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1489254f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424723; x=1789029523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRvwnXHVy/jqUCw/PL8fHu/IurmtPlulBPvKYqgBdWo=;
        b=c7toXsFxIWtrAvnBFwldh/EiCkIPsnP2TlLCQzeIn1ochWu7N+ykr5+iKHG5+4DLOB
         kBAz0GycDqy+XtYMhF9UXJz7Xb4UoCfYm0rrOCu+IVFQ5/PUAzxgIv8v2JFD12JHKD0h
         J4a17K1NewejMQBVgPfoWMqyIhRlIlY/3jNPhsFav1EAAEHvynBa31GVrh1s1+UeXpJX
         i5H5Rb66foe7UeqFZref/6hdhmCNnmKGo7l0BypXIT771J1+O/JRiipMYEZPplI30eFr
         AdImVjPzoJW2dyrKwdYYK1bJIBiyzUOdmRR1fg8zqmTEWLRFwiSSoMRTLnafofpIsiHi
         Y0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424723; x=1789029523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRvwnXHVy/jqUCw/PL8fHu/IurmtPlulBPvKYqgBdWo=;
        b=tTOiI6QpCukK/idLFKcGLdIKm0WNhh5Y97GfI5wSckit57F2Cv2ZtbybfQrXrwZrM8
         L17dzajgagAszedlm6RJLQf+4mkVuJIwAFHE6NKshO58dyvuUcdR/kN4mHRK3KxQGjR6
         zlWRYfdH19xTjHmqavZIVt8cywEtdKZ3gfO4MRuvKGWBnnHaH9oUOsLhQGWOIbVOnLjt
         2Wq2Xtamyx+4PNvnC2rBKPyLktPJZYvT2VchkWuvuno9iadW4nqdrF5/4v6wX2PqDXSw
         GusZth4T39Qh6vYPPdQhHphGClvdnN+D3flaYsxXqFier2VgG8LhO9SPYRYsE+Xq8RxN
         1t/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx+dNmTg4UGedCIWfXInzClcPukhM3IuEnlBQhLKz83KToLnTezHIHDcg0dFBKeK4DPDGp2p9w5X8dYtuPbDn5r@lists.infradead.org
X-Gm-Message-State: AFuF++k1JCD8eduJu2bsNGkoM6VIhMqWb5W5L21kG37R4vRk8iHnLm+b
	29ORKuwhlW2uhXdQXrX0ATY741w3BS8ru+O9kY9A5yK/rX+uxc+8h/n6
X-Gm-Gg: AYBFou1l8vx3UZQo4JY219TG0pjL7hltg6/rfafyCgzVOt5cBtbWf/rynsoH7jDjJvM
	doqKDpRPim99pDgYRdHK447OsdnNkjK//vG0lNCuOEqVVodAf7oDfT0QrCQ8/fD5IKHnIrtoQKP
	0iV1rbJ0lWjGIYvL2g8klGveCrKYSCKdyNDrnjOoSnYaxGIpY5IcyX/oU8KCW8Ft33PGAryElw7
	lxiBwmf1mIhUN0j6/8lms6A6gAHJ9HeSwL07rYbuRZ8BDWVC2PeO0LTjgkHnJMo/gX1Ry+ELv9B
	JjY202ikNy3xG2p5IY5wFY3kyoUelni/medZgj4cDUXb1EqB/w1mOJUjgS0DJivZnV+HwHgb25B
	SjtzRLnP6e6AF3sTV+hd06cDhT6QXQaZddaqp/Z50NWhjWD/R7DZeWyROsZcvN7Zj9sMlHm3ejn
	mkC8nRN/kZ/u+Qk8durjTED2XnNzpuVLx1OS5PPiCg0myR54Zf4uojCtQCC2e4LyW37hJuuC5qW
	tz9
X-Received: by 2002:a5d:64c9:0:b0:482:fa3c:3e95 with SMTP id ffacd0b85a97d-48488f07dd0mr17932547f8f.8.1788424723044;
        Thu, 03 Sep 2026 01:38:43 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeae34sm13075059f8f.32.2026.09.03.01.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:38:42 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v5 0/3] gpio: mmio: report the line direction on chips without direction registers
Date: Thu,  3 Sep 2026 10:38:41 +0200
Message-ID: <20260903083841.2114833-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAMRc=Mc3u+2ApzMfFFM1L5MJROaQMSifKReJ-3T+9EX3Zdqzfw@mail.gmail.com>
References: <20260903075940.2089367-1-mehmet.fide@gmail.com> <CAMRc=Mc3u+2ApzMfFFM1L5MJROaQMSifKReJ-3T+9EX3Zdqzfw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_013844_945984_D8539EFB 
X-CRM114-Status: GOOD (  10.69  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> Why are you spamming the list with multiple versions per day? You're sending
> a v5 as I'm looking at v4 and I really don't like to have my time wasted like
> this. Please limit yourself to one iteration a week unless you get a set of
> comments in which case try to stay at two iterations a week at most.

Sorry, that was wrong of me. v5 is v4 with only the get_config()
documentation corrected (it said the answer comes back packed, it is the
bare argument), no code change, so please review v5 and ignore v4. No
further version from me until you and Linus have had your say, and I
will keep to one iteration a week from now on.

Mehmet

