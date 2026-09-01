Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1F2C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gi8zlUNdWCzsqZSiJ6mOTo+NkAOh4pwQ7EWq01VYbQA=; b=U0bIfIkHFUlOp4N8G5tKemXi8u
	h5kmo5Wr1u0jrLmremupVhkWowxYI7hPIklFwq3t0jxDy7RDvxA7vpZYgqp2iF/WvRcd8skDxZLgF
	y8a8kPbYe80W+GWtmuP8jEdcdFjF68KQ6xunqpd2yjVuChlUFM6BY5yEV4uC9L0G5M3mI9z9rhM23
	NkajX0R+DbOskAPLlQFiSqgxhIcKOKftnIc0ZCfMq+tJIwvLbomDx7i0DUIZ7ubClcgae/uqoL6X7
	FgSzIrrEz+IofefJzbq5tDx0thewfBZFTTdwVPqeF4RV8I9e3WYYqnTAZb+Qg++AiURFbtscIcw4F
	GFKuiSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MPP-0000000Bf2p-1o6R;
	Tue, 01 Sep 2026 11:12:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MPM-0000000Bf2I-3tec
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788261123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gi8zlUNdWCzsqZSiJ6mOTo+NkAOh4pwQ7EWq01VYbQA=;
	b=ZboH6U7B2Wi/tDh1ORIylhxVfSNTxoUrH4eJn+ktiryyYPBG4bJe+2jDp6Gc9YyA6Agwmv
	A3apuwUx8my03cyVvAHW6Aet6PKGfBUeoeJKYZ6R5jCJ+YKsYPHe8yZ1y2S1lfCY3fcuM4
	b+/tkv40gfpiHpIxxAo9wi4Pizguf/Q=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-JnqSwGcSPfW4B3puKHEy4g-1; Tue, 01 Sept 2026 07:11:57 -0400
X-MC-Unique: JnqSwGcSPfW4B3puKHEy4g-1
X-Mimecast-MFC-AGG-ID: JnqSwGcSPfW4B3puKHEy4g_1788261116
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so93071185a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 04:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261116; x=1788865916;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi8zlUNdWCzsqZSiJ6mOTo+NkAOh4pwQ7EWq01VYbQA=;
        b=Fzs01AgdJxr+Z75EKU8P1uwNdRDag3WJ10ou3suzT7TZzdENa/n+qL/GX3KvpyJvI/
         CwgfuojZGpblPxjvJWbW1WOWtXJBYfL1D7KX38mWnLh/qoQntb4tZAKGmtno+rAYGQXn
         jBGnCZgS7dF89hBv+ADd+4gfngdCkxYClETxfjFRuDO14qPaWtwhJV32pQcUqx50OokC
         oEccikMkwOeYQnFInjeHdSRKkac3wzwEY9G+qzBBPF891XOcLOEGMXaIWbUHHRD7c2z/
         Onz2txBnj2/hFF1AB4kFGqNdeaPCdxX2NMXJWNWQkalSn6EJ8RiberAV3fTXUYs0YdV7
         5csg==
X-Forwarded-Encrypted: i=1; AHgh+RoWGGI9zvQ6MM3f+C9uRkBYDst+TTBQijTRuuCWOLvlMmQ2wkmTa2D+JrBeB4T/YlCAOMgkWlpuph6pBmVvbI1b@lists.infradead.org
X-Gm-Message-State: AFuF++ksii8ooyZy31JUN5fK6g9KwkXj8mkJSwB8ABQR4+8q0evFn9Au
	zjxzWztpEgIyqJjVrjnpKx0Jp7yNY/z3y072hga8w5j0Ix6/vViSgkss6NbJu4ppO0dSxT/ZdD4
	doZQkA62oSkvBTlrlEBubyQQLN/rQ0HLKoKxtLbh6msfcd03PkVKfrcOZT9xX7gHHGM6HhOpg0+
	mi
X-Gm-Gg: AR+sD13ffskCtFI29T+LwIFkTGK415VT6HEOVed8ecHyA+xS7r5lFpk3vs+8BDl6tuf
	oYV6Y+/J82WcbewXIfugEva4NQr4RNJKZgvfU4fCrkqSQPgSNhB/zFEDkO0T/CvLzcTLREpGDOR
	jGl/4i9P/NqJdDppdPIMPLVijNooeCmSbk3yeDW+48QSnmc2wgy47LA7KWiglIMN6Ax124yjfmP
	u9e9f83S/qYjKcmjAn/gu5zbZka8oDC7HlWk5Zs+01JKXqHtlrdV87hpNryWCGrLeXs3qW7SGD+
	2fjjK2o47whFJagyAr0hKRUjfXSsh0R9LadHnuonhd000kgxcjtdtoPEw4+meeDdM9mxhZhnPL/
	jZ+f21NDNmjLWPPedG8l7ANzBi4Mc8D0HqvdGedEI
X-Received: by 2002:a05:620a:6187:b0:934:97c1:ca5c with SMTP id af79cd13be357-939137d09eamr4145043885a.16.1788261116350;
        Tue, 01 Sep 2026 04:11:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:934:97c1:ca5c with SMTP id af79cd13be357-939137d09eamr4145038485a.16.1788261115913;
        Tue, 01 Sep 2026 04:11:55 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173a734dsm1005142785a.26.2026.09.01.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:11:55 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
References: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
Subject: Re: [PATCH v2] clk: fix self-consuming provider module pinning
Message-Id: <178826109921.1923810.15249958200247349694.b4-ty@b4>
Date: Tue, 01 Sep 2026 07:11:39 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=299; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=O3JvY97otagHytxcUyGsTeDj2UPUf0B409ucB+po9zg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKmbfrqJ77ytoHk8SkPfgZsr3zSll1TzPhn29aw5bzHH
 mglSyYWdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjAR98cM/8znH9/ygXXevcvn
 P6jqxnNVri5atM8i+vHb4Mn/Ap68WrmM4Q9f+R7NJDWJGQXse6/8aI8wZpEyD1xj7hfj236L5Wu
 fOg8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OJfgDqmA6ZJJTpDWnlNB-Hmt3mWB3gZTXevHjRLq5WI_1788261116
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_041205_047398_77E0D2F1 
X-CRM114-Status: UNSURE (   8.27  )
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


On Thu, 23 Jul 2026 15:00:51 +0200, Jerome Brunet wrote:
> clk: fix self-consuming provider module pinning

Applied, thanks!

[1/1] clk: fix self-consuming provider module pinning
      commit: 5d334928586b7071bf7b3db19b04a2c0e8f4efe3

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


