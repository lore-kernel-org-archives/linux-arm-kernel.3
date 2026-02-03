Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82CCE87857
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeH0sFwwpTINbEuwtPxgyvguZjBQwBi6mpvw3QmgLNM=; b=BW4HDnFBsWTGkaySKh92pwrKRv
	OC6vK0iA8I3YYaVWifJ1Y8hUe4p+qyK75QTMvRInkqgxtlgedYjCge0HQQP/vWMpqTMzKwwx3UBNN
	bu1cZkKRkDygNnVTCUbNn6RZY7DRWea4N2PNl/GZVn5czbtClMRtmEsrDOGsWCs/bZCkgBpIv2ZHq
	tPqBYqQoq9WKMKNNdBwwgQqLOeN3qmw3EBSXBOIRof2rypEQ1Md5wzIF4OBQgCh/M2pSuPFfnw2Cp
	R9/1cqSXB3jiGQ1e2lpLlaqpfbW6ERAPFd2OauoXcBDUwpryzPhp89IPh44RdgzSY1xSPVT/DoYEp
	zRHTeZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLcp-00000007CxH-2vQk;
	Tue, 03 Feb 2026 18:59:47 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLcm-00000007CwT-35lF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:59:45 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-81f47610542so3396048b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 10:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1770145183; x=1770749983; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeH0sFwwpTINbEuwtPxgyvguZjBQwBi6mpvw3QmgLNM=;
        b=gI2OHXym8S8fzvZckwwUUv+tJyGYPYuZPtDWQ9QWHtVZdT96RLMaKIhiJEx8Dzsk6c
         Ysj2g6dAp7yAhRpkGsZAwggeonioYV957Dl4BBhUPrXvMpB5Z9orhlWDKkslKeoPrTb5
         1oEUjSyUKkk5qrm/P5OYlumYp81yC91g6rBrTCnBJglO9SzOziwaBtYf3jtmK/JPM+Ke
         dwGT47D/IJmdFxWHT4mzhid20SWiNhi94zXvbpBc4SI0f0D3hsERh0tygJXZLIl1zfwT
         0LBMjbztSOdwuok1hkfXePs7cXAxz20LyIQj6J5oIQSUb9fBfwewV8Av5eMZzfm+WRV9
         fOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770145183; x=1770749983;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PeH0sFwwpTINbEuwtPxgyvguZjBQwBi6mpvw3QmgLNM=;
        b=ffXRi6GtIJwdgWVAObcUesy1+UkyziaXeMvAw7nzYwd+2jXjY0DfSFS2MzDgDMguO5
         lJbquSRAM1JhKCZb1UnDm4YE0FIHdXMMMKnAFV0whu5u47h56srCF636rBS3OH3GrbJu
         /4DZkCjhmVpqrGqdFhQvc2QNFyDj6Imj+Dee+TGCz0uhNRqrtdKRzyuJX5939eJDzOx3
         EjX8J+VFnoSzdfIZjE5JGU+D6O4eEidOVWUE7MHLZTew3eW+UNawf2r/wRe1sOn3H3jt
         se36mlJ7r2oDZJUtAZDJHFoP+S+geCFlruqbPYrCoPbNyDRGtXZNxrJ04Pkr0LLiDId8
         aW/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVx3XHwqleQyINNqZaFXseTNcgEipjDcf/0EwTak3ywj+e1WHbo2oTogn+fKz7ynEZxMQS/plKOwkwdADeykkD7@lists.infradead.org
X-Gm-Message-State: AOJu0YzQxKye0FeNfmMHZSJAXqVvrZsA6hN95BSRXIRx4iT3Woancd0w
	W5N2zlW27vp1L9fwRLNs0TFOc920+uE2yI69dabAJCeIcB/AowbqsXuTGMB8LKyLtL8=
X-Gm-Gg: AZuq6aIdh5aB9LQ/8iPhe12iScWVDHfcT6k+Fq+LYIk/z2+ijMN6/VsA4CtumOpQgyi
	cTkIs2jMsEeFKHh8U9tkT5rDg0b99TOxq3/JvZKCWPc/8EO+mvLK8DJAm7k8T9dR7vx8Vt6VeXJ
	avGcD8zJm94xKP7edkBl6r7+zXtjTeWpPMMiJvQnnIqBZ+nF/V72/I6hcMabJYGSQPYQxQ6FT3r
	q14Vd48duwjfb+ege2kVKSqX9lGEuG9N6etSOiLFxLQmpcFpogq54AL7LQCDOidFCXfq78QF1u/
	PHvoD855GsTlZEKz8wTOUOcEo0Qe8j1HLuv5Sl3EG7lrtXNAxkyI+GLjFMpGr2EdqiilpBXUxos
	ZcIiCrJ+2OIZCLk97EVHW7fcTTDrroRbNiKfK7l55UQ+1PpBkl40kTzwNAmjZqbHe5rlaH9EY4y
	YKsW1nZF/zaRiGne8E/Qgx8N1Zs9GxLDT2XqBxh1Hhm7WBPA==
X-Received: by 2002:a05:6a21:328e:b0:38e:87d7:7b95 with SMTP id adf61e73a8af0-393720d09bbmr409396637.20.1770145183502;
        Tue, 03 Feb 2026 10:59:43 -0800 (PST)
Received: from smtpclient.apple ([2601:602:8701:5361:2dd6:2d53:d593:7d46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c85065f6fsm51846a12.26.2026.02.03.10.59.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Feb 2026 10:59:42 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v9 4/7] i2c: xiic: cosmetic cleanup
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <aYIXagCXYb4DrDLp@smile.fi.intel.com>
Date: Tue, 3 Feb 2026 10:59:31 -0800
Cc: Michal Simek <michal.simek@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DE565BCD-28D6-4844-BCEE-A1F60DC84662@nexthop.ai>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
 <20260202-i2c-xiic-v9-4-ce4695f5267d@nexthop.ai>
 <aYIXagCXYb4DrDLp@smile.fi.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_105944_775424_0340A2FC 
X-CRM114-Status: GOOD (  12.13  )
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



> On Feb 3, 2026, at 7:42=E2=80=AFAM, Andy Shevchenko =
<andriy.shevchenko@intel.com> wrote:
>=20
> On Mon, Feb 02, 2026 at 08:37:21PM +0000, Abdurrahman Hussain via B4 =
Relay wrote:
>=20
>> Re-use dev pointer instead of referencing &pdev->dev everywhere.
>=20
> ...
>=20
>> - dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
>> + dev_dbg(dev, "mmio %08lx irq %d scl clock frequency %d\n",
>> (unsigned long)res->start, irq, i2c->i2c_clk);
>=20
> No need to do this here as we change the format string afterwards =
anyway.
>=20
> But I leave it up to Andi, I won't prevent this to go in, if he =
agrees.
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
>=20

No worries, I can do this in the following patch, since there is going =
to be
a v 10 anyways.=

