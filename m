Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E45C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 07:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jnu8+HdD9Vt7ZdPOykOBikIDA2ZwhavNakN8ubRtSgg=; b=YyrB/H0kgrCmecB936qhSyCqMJ
	MDMQF8h9DS5IWH60Vnz4rVOZ5bQqJKB0TGgCKW7gV64U0kMQM2Qt4U/u0JSGsRYnlV7lIWXB/Y8H/
	WtEKvfJqawOWd9T7UXvLslNS+Wbset6qGmtSxKInJoKCXUhgDPk3nKQr1K4NTdq/vw//2bO8Q/CJI
	9kKvOc4qV9rgaW3yoC/00S9LOT5cSLEXXZbKyZqtCSRDSXWuM6/puKNMAPRq82aJVdKI1lDYa2JDT
	tpKlB7V0p9T3Cw5Of8Z+s6+gXdP+BveWz2cb0Av+SynZnSAbxgdXbiLM8qF8dZi6Nqw47ZWmkzxKO
	nH4rkPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEUq-00000007TTX-3OL9;
	Tue, 18 Aug 2026 07:44:32 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEUp-00000007TT2-1HEh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 07:44:32 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38deea72eebso4307324a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 00:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1787039070; x=1787643870; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jnu8+HdD9Vt7ZdPOykOBikIDA2ZwhavNakN8ubRtSgg=;
        b=GNcJuL8rMw9XQtb2QZG/fsq+bQxZnh6JE6lrdky7D97Uenfm7RPvgYi/T5V6S5/525
         LP0siJTnZHf4J5yBf94R+hqvifpzkX7ZHf20GzlJkl0pxY+Rj97U/LEm3n+FMFAnmCDa
         JRwdKzHaLI4W3h7/M56N4Dt4AmmGLTFEQ0S3W6M6S6yWKLqWbENoBtmE04Cb8AvZXU01
         T2Ydi9qs6fpJWhbNO17HFyee9bmyjcXnvuR5JmnxLyVm91fO4v5lCAeWr3NCdBNCeOHY
         fSqIXgleHySIJHS7kL8GNbyL6jHu9mZIAye1DlgNx2ffi17znfOjxvYr+Us1fAKkzgLt
         Uqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787039070; x=1787643870;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jnu8+HdD9Vt7ZdPOykOBikIDA2ZwhavNakN8ubRtSgg=;
        b=A2Bu9cuGHEwwWUgGLiyqo9cvsd52nBT844sWAVMRz3UqNLK1/iCiFa8gSUXmWiVU5F
         UBBs2Z2IEOlpDbIIs3Cd0amRB8goESaPl4blkvBbChBfs35pMqAccl2TlajIhoU6xg/W
         ibsAIAgjWYTVix6D8V7nW4obUmwBfB4UBsjo0NWHbDGQ4AX3DG3Ncx1Tx8LInddg2FJ9
         vdLEJRy+XGHIF4gnZWpoZ+w+wp4GIqx4ab6+PyKkp1hDQmvHI9lMYwMhK1C2+51mnXLa
         FLo0DiUFVfgEPPW2RGm3qWlInjtVMTMcIhUTr1sQ5AQZAJytwnBIBOJbCmZthIYaZBvX
         VZ8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrV8BnUgIEfFTDoGOBB6WfTSkmO7+a1AnO9myFauEnu6f/ezfxLdiwU5f7/mFYwIqN9GUkiYfstVwhLhF5fs9Mz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9nzc55wHwIqqppVi79Uh9sPlcU7aZUChco+F53I8tu6sBwmy5
	sZJPiNgfuO4xp6yDXFaqAxkx4XzpC63S+b2ta/6rVripwVXTmju8sNTR4DHsNjqnyZxpdIso7+n
	WxJ1Cq+k=
X-Gm-Gg: AR+sD11paY1rlysSwj5x1Uh5ClavaCaYhMElShA0FMHTceHvBmlQ5WstKmcQ/mk8juM
	nafwPdknwfUR7Ns01FGd1MLgnOqUm0Mx2aW/09Eey0W2WEXNjV/PzDykHpZHp6WUCH4kGFCW6gd
	ssKQ7X73dAh0ZZjx4WEKWBr/lG7QpYuw1JzpgRkFiEFSTjyK/BEZ11bkzt8PzNoCce2Dkqm5ztP
	uF4VWY8DdU86XfkpUUUKf+PIyXxv7DjDuPhIL0Yom6RlAxtJDm97dwVVL4Enm9lxmnf6CHCXR+u
	1OuyACODaWhbYQMXNUUKyNFF+WXUZ5n+tQ8PkL8AWOdSUgMXMewDZ4B2DB1DlC5HmAerb7AFOro
	5wj2bDb/ZtnSfUqi9qu5ab9o/+cZJpABY6gibYR+L6G5FJAmn8IDAABNXSw07NobTytSIm91Utx
	QeSKzFpVD3/UO64xGFSwIVw+MlFAiNIQVw5Kei9qu0Ok1JbSr4gnNAzUpdnqH5b5uubFy1W7U=
X-Received: by 2002:a17:90b:2587:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-3933b741419mr33538684a91.5.1787039069792;
        Tue, 18 Aug 2026 00:44:29 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bfa0sm5056965a91.10.2026.08.18.00.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 00:44:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 00:44:27 -0700
Message-Id: <DKRWHA3VO9S8.3QNFPU0732I1W@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: xiic: restore runtime PM teardown in remove to
 fix clk WARN flood
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260814-i2c-xiic-restore-runtime-pm-teardown-v2-1-7ae5d0c30ff2@nexthop.ai> <aoHf6UDxD68YxLYm@zenone.zhora.eu> <DKQN4CNOESWV.2XRL8DIC87HYA@nexthop.ai> <aoNdskB_y8mOj5qr@zenone.zhora.eu>
In-Reply-To: <aoNdskB_y8mOj5qr@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_004431_355776_73300AE0 
X-CRM114-Status: UNSURE (   8.50  )
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

On Mon Aug 17, 2026 at 12:20 PM PDT, Andi Shyti wrote:
> A solution would be to drop the managed runtime-PM helper and
> restore the non managed runtime PM setup and teardown. Otherwise,
> this ordering issue needs to be addressed in the runtime-PM/clock
> framework.
>
> Does that work?
>
> Andi

Agreed =E2=80=94 that's cleaner than special-casing the ordering. v3 drops
devm_pm_runtime_set_active_enabled() and restores the non-managed
setup/teardown.

Let me try it on hardware before sending v3.

Thanks for the feedback,
Abdurrahman

