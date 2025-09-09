Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF362CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5SuLPKP6QNmvh1TmNhSBXqAPxbhjyq+GV6/uflQ99Y=; b=s8n29YiBBMW1PUuRxq/iaTSzXI
	+Yevjz3gOLAKzwhNtgB/KJZ+Gv0GKh+qC3YXL4gjBFgApjC9IxKYu7l6awaV5Pn8iF4Rcy7Xhw7pX
	ND5AjGMxecbakny7HEyAZyE2BvyJ0GEFKZ4stMzyN2uPuKFpCb/7L7mfcEkBnDxL8p7CjNIDcQVjm
	aGhGmn9jEAD4NyLRorV2D1fybrlroj8QLdqUx6/jnp1WM3hy6QrGKB9RWC65FeRD+60bzeTKuXEUF
	P6qyP9x9oM3nshW7jHlo9zWk+xjulnG8CWg0eRb64dJg4+srkljgZeWw0Bel8LBGMJKF5QZtUozID
	f9GgYEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Qw-000000088xO-2NER;
	Tue, 09 Sep 2025 15:39:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvupM-000000062w2-3fTc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757410791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R5SuLPKP6QNmvh1TmNhSBXqAPxbhjyq+GV6/uflQ99Y=;
	b=Y+epI0zh2NvHJ8tNDM4XfDtVs0zfX/m/9+oXaBSyGwyINeR1dClIC5KHuTdTEg3dYAT+/9
	wAdLCS/QQuun/oCkIdguX57GUSsBu8pMFNhNQyhEj7UesGTUAw+3lp3dMV8FzybfobO11v
	GhswMExGX3udNIAfH8dqfFzK2EgIWuo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-LfdjCJ7fPkC-a3PzZD4uTQ-1; Tue, 09 Sep 2025 05:39:50 -0400
X-MC-Unique: LfdjCJ7fPkC-a3PzZD4uTQ-1
X-Mimecast-MFC-AGG-ID: LfdjCJ7fPkC-a3PzZD4uTQ_1757410790
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b49666c8b8so116692171cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757410790; x=1758015590;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5SuLPKP6QNmvh1TmNhSBXqAPxbhjyq+GV6/uflQ99Y=;
        b=wS+xMjjqLMRgxREUH7WnwG9ZBVyD7b4zc3EfiqkGN+s7AxQVtpNiSTBvrWy8Ioduoz
         sajpvwtV5KyZXpwlGcooQuffFe0uxY0vBegVIu7t3NT3psxZWruHL0ECJOH4u74vg/xz
         i7bdzVIZ00UblmzK5Cw0wCYa0Crb19c6Caq0i3UhzsRztqzy+d19CHykx3dRlgj0b9HX
         k5I+Nm6F50AhpQ/pAzdzTEt0BN+DAXDer5Gd/RAUGGP1NJ5/Kr8dfwM/4xeUqt8i4nUt
         PwPkQ8H+TkeNmWRpEPVsU4VCS1Ri8253Fxoa9Z4KHzlwYe+uHuop98CfH1R03E2wMXJR
         UMrg==
X-Forwarded-Encrypted: i=1; AJvYcCXX3ANRzXfI4Hf4aNHodpyn+qcK8k5OE3mjsyhXVtt5YoibGRS7AB1yNzU3wdBh4TI2/Fynf//jQGa8WEJ1uAYn@lists.infradead.org
X-Gm-Message-State: AOJu0YzhE4QPeWnQ9KzyYOZWKHCudhc9kHOdWBq5GAPFAlgxST8mt/Eq
	WNxob7ZTRLlBCh7lVSIMlamInQpKxHw640UNYNk+XCMm4miLfh6p2jWBSoje7mEeTG7Uhx1rDj3
	ukHQSF6RZsO5kb9bzo8WUDg+FRgKNlP2MU+KGMiZ/UNs47WdVBGcjgTnKQCLpKSY3FgYpfjCceB
	aA
X-Gm-Gg: ASbGncsZqIaycPB8do37y+9dP7FaRNOEuepxhYuHgLrb9rvaZ+EWMf3viouLB+5tW7m
	Jhb3JF8xK4ZQnt5ij2iuIIwt4x8+hDWXACC4hYiuqk9hJpeiVJr8WXCOOtQGqQuUk12w+cHIRdA
	MAsPjqTLzADFLsjaHH/WIZnHgaA3pgUXbJYJByjWd//mGL8q0Tkat5+Yy3eQIP+FlHf1CFB3EIv
	+DLLR9lO94Qg7D/758jEu4cDyYnrWKlPVdIesP49V74f827mhyHPcZoaY2Cz9sa7rDpqczgmjSO
	CQ6dweD18NoLF0GB7P6clU9eMZE8CrP7bxsHMdBRVhMmO7ISlKnYI6JwHbt5/KvdgWlVw71FiO4
	ksRxcIVqsoRtyYIzeyJw=
X-Received: by 2002:a05:622a:14d:b0:4b2:8ac4:ef4a with SMTP id d75a77b69052e-4b5f848239dmr100627941cf.65.1757410789868;
        Tue, 09 Sep 2025 02:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF32u03YWf0xFsHNwv4lu2FNzdlBMcHC/jd+orwwY/MAKlb650jQ6YeSwxCEA5UmnrgNTF0kw==
X-Received: by 2002:a05:622a:14d:b0:4b2:8ac4:ef4a with SMTP id d75a77b69052e-4b5f848239dmr100627741cf.65.1757410789492;
        Tue, 09 Sep 2025 02:39:49 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61bbbc28csm6792371cf.28.2025.09.09.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:39:47 -0700 (PDT)
Date: Tue, 9 Sep 2025 05:39:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aL_14XofqnwAd3QE@x1>
References: <20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com>
 <20250901-clk-ssc-version1-v2-2-1d0a486dffe6@nxp.com>
 <aLdmXcdJnoeXEJaQ@x1>
 <20250909085013.GA26483@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
In-Reply-To: <20250909085013.GA26483@nxa18884-linux.ap.freescale.net>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: delhX_3O20pfgOXTynMO9Gvp-XT-jFUyCqsaaGdwTdo_1757410790
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_023952_983406_26085DAF 
X-CRM114-Status: GOOD (  16.85  )
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

On Tue, Sep 09, 2025 at 04:50:13PM +0800, Peng Fan wrote:
> Hi Brian,
> On Tue, Sep 02, 2025 at 05:49:17PM -0400, Brian Masney wrote:
> [...]
> >> +		if (IS_ERR(clk)) {
> >> +			if (PTR_ERR(clk) != -EPROBE_DEFER)
> >> +				pr_warn("clk: couldn't get clock %d for %pOF\n",
> >> +					index, node);
> >> +			return PTR_ERR(clk);
> >
> >This chunk can be replaced with dev_warn_probe(). Sorry I missed that in
> >v1. Otherwise the rest looks good to me. With that fixed:
> 
> dev_warn_probe() could not be used here. There is no 'device' pointer
> here.

Ahh ok, gotcha.

> I take __set_clk_parents() as example here, so use pr_warn().
> 
> >
> >Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> Could I still keep this tag with keeping pr_warn()?

Yes. Thank you!

Brian


