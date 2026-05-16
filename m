Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DE3CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9iwndGPdhhfbaDqoUlTzWSRTEYwd9nb6CJHJivhXZA=; b=O8t6OYJ+NlUlidtRpm3olkPnsN
	zMtZ+A0owwfHGNHvt3ZCqvXeVEj5XKh5ovI+RnEgClp9haWPwHjyBprbH5iGFjdXoC/IdrgQLsfDM
	zU+ApDz68IOODJwgfyhbTA5g5jqAPnDWqaQcdEnOT5arZ1/A0HS8RzFL0F1CeFQUcBk2IbM+2ymqY
	e8w0KD0VIdsOGhUQ4nHDv/BwJLgmFD0+r0GU+ZMWK/pkXAwY92RQlYPe61CIqKUzJavISbX5O771Y
	vluiAG79/hNxZgSPrkoNYTgMxnwfhs5g8XR/v/30QlPQhciqqzGARsEF/BX4PvTZMlw6kzGXiXi9/
	/uLIsN3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOAzo-0000000AT51-2QmB;
	Sat, 16 May 2026 09:07:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOAzm-0000000AT4V-1GVp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 09:07:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48d10c981e4so841515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778922460; x=1779527260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9iwndGPdhhfbaDqoUlTzWSRTEYwd9nb6CJHJivhXZA=;
        b=YMtdVw3W3AVARdu6Au0AMNNp1+XceUc1j9CVXgULyWJ5p8+dJCljUsvy9PCSQbqSjT
         G/7g+o1leGpAr0QbFjzcHd3dk6kuFL83D7h26TkM6O0A8od/yLnX5bmAa2ohucoTYHTS
         Q2Jw1IiQL+1tDBLk/u8DOyyij1vfWlL8uLSh+VqXAVpr7emuE8GnQPmvgzc+4+sWZlSZ
         rsb7bPsGHrFAxml5gyBx3gFz2K7JeNEO6J5loLiDuS4WrAl5+HrycTZnuQfdO3Ns0VvO
         p5hdbKinhrrXJw+U1rcfcBgifjrk22Ytu/w7ivhRTsL04EAebbYoeQhnUr9xNdlpEKf3
         scAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778922460; x=1779527260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9iwndGPdhhfbaDqoUlTzWSRTEYwd9nb6CJHJivhXZA=;
        b=VJfBI+x15jFO/3edWTZ+p5FjqXXOLYEDcXR5v6ztoX95b5BN1Wq7FwwMXE47erJoxr
         zP7hF9Dy4fTnwO17hCzijhMk0Vb3yooO1rH+ahz8X9fSDn6CaoDLwHtaJkvsXnLvESVE
         uwZP0RCAO7eKPtH2OPqoqy91YUz6sXxO2odWlbN0Z3om39kIcDNnoZlSXZUBx2qYuN/k
         LO/7nl06EQWVSArnI7ZZ4jTUhe1m9UMAyWyVkzjwkBt8I6m5R4fqUGonxCa6BZhh6xiX
         pmIMgiZ1MMwjZmZjJbJhga4/W20VZQE890p9BaDrfUmL8P3alxvwyARq3MzPC1WaHMob
         HUJg==
X-Forwarded-Encrypted: i=1; AFNElJ+/mFKfu/rCA1l6ScvPbaKepObdn/K48k5iTA26C7Dk63TO/6NkEQoP42EtUO7Se0TMytj5S9U2kM1rmFSnOMIS@lists.infradead.org
X-Gm-Message-State: AOJu0YzKr/XNV5GHx3OcC3z4KDod65DxkOwGdmyAaiZwJn9Qy0cbDkDc
	rGuEoQSV5NwixZlRusUNPm7v/3BsOx5c5HAmQwMMQBLQ0RDryP636l67
X-Gm-Gg: Acq92OHI5Rbg4qfYwIv2bo3doFiegz8Bs1x/jjShjPpRWVomU+QgUdHqkvGqmU8ooYC
	r2OUrKEds7V47EhjmufzoQlSyQmow0GvUjARhVpATUlkw9JO1PEAOzxsKvEEAD5xOk6Qe6wlJQR
	68mWvZ3lGB+g+FXYckD8I+4br2lMekkqtC6CnAoMyMutlKyow8FaPmH4fkqSgT/J/D2Hh02VmUx
	o5c3dnJ+5BZnsC7GbTFIt1fLQo3UC7AH9p79OrCNWFZKD8Ce/JlLnxuPjLuVharmpKONiksFuov
	MFxq/7aouQyLg37O9ZbNjigdKF9+s5fKuIeY8jJRSTvQMMc9g0IX5Dp10CBVD2wpUwMftudFaW6
	gO3P+3WemxaPcWBpetwfOgEKBJDY+m0HxIW4aUCFVFar6ROVDvtWFVq1TdufDX4hvpAt1L4gRr0
	oX0MIIvuivgZSMM774yiuoR/AnLBics4qPfk5H3mrFZFWb
X-Received: by 2002:a05:600c:4704:b0:489:1ca4:c999 with SMTP id 5b1f17b1804b1-48fe66550aamr47129795e9.8.1778922459852;
        Sat, 16 May 2026 02:07:39 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe66544sm32827265e9.23.2026.05.16.02.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 02:07:39 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	hcazarim@yahoo.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: Re: [PATCH] firmware: imx: scu-irq: accumulate wakeup sources via sysfs_emit_at()
Date: Sat, 16 May 2026 14:07:26 +0500
Message-Id: <20260516090726.38362-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <2026051633-doorstep-sequence-6782@gregkh>
References: <2026051633-doorstep-sequence-6782@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_020742_379892_BF362A47 
X-CRM114-Status: UNSURE (   9.75  )
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

On Sat, May 16, 2026 at 09:15:54AM +0200, Greg Kroah-Hartman wrote:
> This is a horrible sysfs file, and breaks all the rules.  Why not just
> delete it and use the proper api for it instead?

Yeah, fair. The sprintf change just papers over the real issue, which
is the interface itself.

Quick check: no Documentation/ABI/ entry, github code search returns
nothing outside the kernel tree itself
(https://github.com/search?q=scu_wakeup_irqs&type=code), and
codesearch.debian.net also shows zero hits. So removing the attribute
looks doable.

Frank, Sascha -- any out-of-tree readers of
/sys/firmware/scu_wakeup_irqs/wakeup_src I should worry about?  If
not, I'll send v2 that drops the attribute and logs the wakeup source
via dev_info() instead.

Stepan

