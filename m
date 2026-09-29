Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37607CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 00:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbuNkQK/L+pg/yDlIMlRRHsYuQVsJSZCaklGdmmjYtU=; b=MTGp7qfACZtlTk6QVJimOxyDNr
	OtbKNejWJJOxX7rXgVceEuD80WO2Lr8GHZvLg1OU2oHFbUwr9DkdPRZAvvk5IYhkuufMGZBsS+ge2
	DzgbrqItWWSxoA6NCPTmb1LbHJLYdh1I5fqdcoAgssos7o5iWOXQ34yJ/02zBU1Eaji+XXH8d0Cl5
	V313d0GV8j4t78E8GSDA5KAVIZyGkIYTjecToRRNAhip6BaPEJDWQcv5LL6L9o3SYIyxAo7woJvu2
	Fo2ntsJYYijXFdt8LCmvTck+qXN2DqnxJnjPy+3FoafPUTkWxtuzin691P/+kDcJ5wwyryDyHng2t
	YVPz+8FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLS9-00000001wud-1mlA;
	Tue, 29 Sep 2026 00:12:13 +0000
Received: from mail-pz2-x2a.google.com ([2607:f8b0:4864:3b::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLS6-00000001wuC-2W8E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 00:12:12 +0000
Received: by mail-pz2-x2a.google.com with SMTP id d2e1a72fcca58-883a16b758dso314935b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 17:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790640729; x=1791245529; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbuNkQK/L+pg/yDlIMlRRHsYuQVsJSZCaklGdmmjYtU=;
        b=NlQn72BuBXsHLGXdx6G/K4xbEJtyXmVAibuxmI3feqM7pCjIlU3d+rIo9otkndhtIa
         AMfNVpfqCtIxEvW+ndFWJJsrIhT0Pcg69CnNIW2WWb2Dk4HR1T7lzHr68l1Q2GLlv4Im
         R2tIKetLBE6WTjULSQj3IfT1w+5Fw1WO3D1GQ+/Da8kZqhLutDSwTG/MXT7sUa1LAqsP
         CsvYyKnIew08jiuoW9VabrCbwV3IlQ3bDJTSENkZEaTWN0WHg7b298sFSPgbJVj0V5GD
         Qaq/CpKdK/F2F+qvqQPISwIFAC7M+X9UxFe79jK5ILWUMXJgXA/qblIXDsxY2KqDEe+7
         0Qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640729; x=1791245529;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AbuNkQK/L+pg/yDlIMlRRHsYuQVsJSZCaklGdmmjYtU=;
        b=GDTTzbXaWaHgSgU97xhHYLxhDV3M/rue7KdG14j8NTE5LNQhe8WOgrFdNzCJla23Dd
         /eEukaSBJcqKkRtkmGE0XzroXwRkx2rbRXgUpNJmhcZI17vO4B1j3LyOIPgdQnp0RLr6
         MIMOD8Za6tal2C4BT3iY6s76jl3amrqa+D1GlMK6Vefjm2M5n/UTU5Plenl3lF5thbWc
         EpB50DQbDXvBADofRD5DZVSnELkouvd9GwY84qt1rNy6mIIWOGRLvwEfAlZtGVC762eg
         T/ujFmkA6ZEuxRro6gERh8VcR70OWKGRo7Na/6+PC59BTBBfrMruBniHeiFh6DvlvaNp
         eH0g==
X-Forwarded-Encrypted: i=1; AKwUvBwJuXE2MhK8BC5i4Q9zeJ+gKFAOFKVZGd1SRbCUihAuu8Zson7W4JsDGTd2V0waKY6SbnDtYenG6q65hUws/Xcu@lists.infradead.org
X-Gm-Message-State: AFuF++k2szqh4GzE7IB5BVrIUlds9FDVnQHzHcCbWvyIDggzENfX2cMG
	f+9d4IH8WUq9ZMKK38HGu87dScCldwnNfAkUdzpGiCCehRf0NDpRF3Pmzmh5+RCp9wg=
X-Gm-Gg: AYBFou3dnKXwkaaw8bzIVm6MNtRDH8oGqF8wuxC1g8BGxYOm9yz7dBt8U84x/njaOF8
	PigRbhEWI1viVhzsII+XI3EAahCZXWWCEim7suUMyYV+Tr6JhGgcbM/zeqKAUskCe8Xywn0Sc6T
	HWzjJDg+Y6EI3Ykfmt2wsNxQAeIoatPt5TbECypSXHp5kcxoNUNNj4Os8/xG0cfTUjVaG3tHgIW
	XmDJkIGIcSFg82z1mcHIzX38l1hPNjIPuJLxwHYtGFHJgRh86hbgsurrRJNVvqBPgm1ddfUb1ii
	e5wytuhhCfbO7Q17OkN50dzEvMs3u3yHAfqUiCOHFiyUvgveQDanOorbblOlcDj9tgUfDxvt1ky
	VCsTnd3bHRCu37JfdJNzGIAHHkHqnuB0EH2utlV4My4JthBvUgcGYLXQaxr6hSPLop/UYakXPhS
	iFHxA7IrYREA3tyOspFrQQ7tBNulvf/zbQWHeZy6K1M/k0RgSJktqZv/GLa+DpagtUtETIv9icf
	UkI+A+Bvsof
X-Received: by 2002:a05:6a21:6e8f:b0:3de:4a1c:a93 with SMTP id adf61e73a8af0-3de7cc0d205mr659922637.28.1790640729533;
        Mon, 28 Sep 2026 17:12:09 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:51::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8800974cdc3sm4708243b3a.6.2026.09.28.17.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:12:09 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:12:08 -0700
From: Joe Damato <joe@dama.to>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com,
	michal.simek@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel@iogearbox.net
Subject: Re: [PATCH net] net: axienet: free outstanding TX buffers in
 axienet_dma_bd_release()
Message-ID: <arsCWFmUhSYkhcCv@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Sagi Maimon <maimon.sagi@gmail.com>, netdev@vger.kernel.org,
	radhey.shyam.pandey@amd.com, michal.simek@amd.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel@iogearbox.net
References: <20260927081034.350422-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927081034.350422-1-maimon.sagi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_171210_642133_1969903F 
X-CRM114-Status: GOOD (  10.97  )
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

On Sun, Sep 27, 2026 at 11:10:34AM +0300, Sagi Maimon wrote:

[...]
 
> Walk the TX ring the way axienet_dma_err_handler() already does: unmap
> every descriptor whose cntrl is still set - axienet_free_tx_chain()
> clears it on reclaim - and free any skb still attached.

The code added in this patch and in axienet_dma_err_handler are almost
identical (as your commit message suggests). I am wondering if it's possible
to factor this code out into a helper and instead call it from both places
instead of repeating the same code?

