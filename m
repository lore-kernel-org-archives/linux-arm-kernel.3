Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD58CCA465
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 21:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:To:From:Subject:Cc:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7H04CVxxX4x8yKDGeGsyvBX1tcUcpxtXmtydhBTctSk=; b=QRb8eOep4whieaRa/yAapBKEip
	Xiwlyyw6TMn/9amjMAsMge6ShYZsFeFQjnUF28wNJRGkTdp0pf7Ks+lhdskHfmDepnom0PNiICsB7
	HSy1pMS/mzUUhflqT3zc8KioQWe5jI4nYrkEx65D1SxcoFQ6BP/gsH0oYkErOESpkmXBDsOgjgZDG
	GZhFkdIwifCZeDO0p22tEkqK50rgMGi5cqx91VNeRapZjRJ8T8hxwBcwFXJoMvlTD0Ahy+lqCHFFI
	ezsH4ILaBbvnuI+VB1c0eXCSHb1LERbSEfvuM8W59jR9TtDFJMJpfXqTmtDzdQs6ChUSIc+B/upQK
	RFR7e9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSd2-00000001PPk-05nP;
	Thu, 15 Oct 2026 21:04:44 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHScz-00000001PPE-44TC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 21:04:43 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-3550c917fd3so3447614eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 14:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792098281; x=1792703081; darn=lists.infradead.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7H04CVxxX4x8yKDGeGsyvBX1tcUcpxtXmtydhBTctSk=;
        b=CoMIIMJnKeKCap1p21b2K9iGrbaqHIBwqrBd3OcDBesHu4+zhpfMbxEaDSWSpedLcI
         bOtCNLp9uu3WLcH4R9SKTW3DQ6rMwgnCz2k+7vWVjD0t5ad/qPGoGeAHOLAKtO9HwHuV
         izIqthI3G55FBLPDXRFpfgxMjFLvrcnCz4pIQvazezLYgxWixalhbIZrGH3t4YZoQpsB
         pGhoismJoxmGkTnj7U2OyWxKkjRoQ93na7NBYeXOUurw+w8UbR4oZhGi/ni/FiX/W72D
         k22z2/6sxaF5lW2k2zBZWUPo+D3S7R5REJ/v9g8uFmn+5m+PKZy7P4sOknVgd/2F7kvH
         dq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098281; x=1792703081;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7H04CVxxX4x8yKDGeGsyvBX1tcUcpxtXmtydhBTctSk=;
        b=cYHESTcgQ6jl78iJ3o5pIWknwjOLs2KFtB/yz3WhHFvoKF1DFRn7HxpUmKAvbgqvzq
         XfY/cV1T8donGJ3MDMVZZIEJjc+YTe0opouoyNwTKb7qqvlQmD9qovnWaExfptEPK3M1
         wsYi9m6fSK2+GXmUf1pY+/AnkMddQP72IaQTqAnYyI5x+HQoS9KgY3gIKdebcQ7EoNPu
         C06ruVc35KWuAZ+MgL/OlSWijDRqTjruZ2ExvGyWlsnLxwNLY0rZbKAuwmsYM0IYJDwV
         3bLD6KMB8Fx9yV0i3xcfTkdtF+RtX9zX5Uhri/nqjqoihu+2NmJoMt9a+S3igdhyAgl5
         3RnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIoIEXU+8xdc83+/lQN3s16aj82fhkJfLQ/zUc52tFgTWNrte0JP1buh6CHcwPXiRO8Pr5mu1WkNnONZfEThFG@lists.infradead.org
X-Gm-Message-State: AFq9FYJboxLh61mpc8S9SWA+UxT2JoemvGEDqCAvmtyPpOyNoN8VwR1d
	Huuq2ZW/BntVFQYs9+m2uyS/p7bKgLsbgnz3HXeWjExSEBKEoElT3uOgAiMtv+z/EH8=
X-Gm-Gg: AYBFou0Dd7ZKT2fvWvbzzuTcF+rMywzB8A9YYLpQTf+Jb5eCg2oBHnBfhFjAcFUrfTP
	HmlVHLpgH6r4M/iOFmqvCOl622lbdCO6Xd371vLGwN2OVTvY2qoTX1hkTXAlMtzyhAwkMYJxTGz
	qp1haPXhSY9qoSjSeB15HMhnPpN4kK6RPnw5yhoQuElXktDJJ4k6hLwfIs1QXwvTEmic48sIYWz
	wKPHVG3z5uNOgmXiEsjabuUwrEHQYSrsf0qLXDxzG/QF4so5w0drdxCo3zqTPX3J4jSxLhv28ks
	ZAuMZi1kHEwyniRvoZ6tLZZnO8BI/ykXycvsVWhup/TEm5aj7OUu4+ec93bnd5nyb8aeJejU667
	8Q/yvxp2A9vUOCyd2GzSHtZNDJZJ/eAddfsSDUeMe+LKGq5D/msv2noEcIRp339hPgE3YxOBmx0
	07qKAh2UfcxO2HowIdPJxSseizrjV3LTLDuJ5T1sZXdQEKlWYqA/30Zz3sUOqNLvOJCS1lNaQ=
X-Received: by 2002:a05:7301:b13:b0:35d:a0cd:e4e9 with SMTP id 5a478bee46e88-35da0ce0d9bmr8413450eec.17.1792098279540;
        Thu, 15 Oct 2026 14:04:39 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm814741eec.24.2026.10.15.14.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 14:04:39 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 14:04:38 -0700
Message-Id: <DM5PTJLL1Q7I.3LGRGXTNBA9SF@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.22.0
References: <20261014-i2c-xiic-restore-runtime-pm-teardown-v8-1-40668c270069@nexthop.ai> <atE6LA8SFpFvZfzZ@zenone.zhora.eu>
In-Reply-To: <atE6LA8SFpFvZfzZ@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_140442_045946_4EA758F1 
X-CRM114-Status: GOOD (  11.46  )
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

On Thu Oct 15, 2026 at 1:40 PM PDT, Andi Shyti wrote:
> Hi Abdurrahman,
>
> On Wed, Oct 14, 2026 at 04:56:55PM -0700, Abdurrahman Hussain wrote:
>> The devres conversion replaced manual pm_runtime_enable()/disable() with
>> devm_pm_runtime_set_active_enabled() and dropped the remove-time runtime
>> PM teardown. The managed release tears runtime PM down in the wrong
>> order: it calls pm_runtime_dont_use_autosuspend() before
>> pm_runtime_disable(), i.e. while runtime PM is still enabled, and devres
>> is LIFO so the devm_clk_get_enabled() release runs afterwards.
>
> ...
>
>> Fixes: 50c63491ff26 ("i2c: xiic: switch to devres managed APIs")
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> pushed to i2c/i2c-fixes.
>
> Thanks,
> Andi

Thank you!
Abdurrahman



